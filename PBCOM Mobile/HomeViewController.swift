//
//  ViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/7/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var loginButton: UIView!
    @IBOutlet weak var loginImage: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imageCarousel: iCarousel!
    
    var valid = false
    var timer: NSTimer!
    
    let imagesArray = ["StaticBanner", "StaticBanner", "StaticBanner"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpCarousel()
        pageControl.currentPage = 0
        
        /*
         UI Gestures Recognize for Menu Buttons
         */
        let loginGesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.openLoginScreen(_:)))
        self.loginButton.addGestureRecognizer(loginGesture)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loginImage.image = UIImage(named: "LoginIcon")
        self.defaultNavigationTitleView(UIColor.whiteColor(), isHideNavLine: true, isTranslucent: false)
        self.startTimer()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopTimer()
    }
    
    
    //MARK: Button Actions
    func openLoginScreen(sender:UITapGestureRecognizer) {
        loginImage.image = UIImage(named: "LoginSelectedIcon")
        let loginVC = storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    
    //MARK: NSTimer
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(HomeViewController.showNextPhoto), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if let _ = timer {
            timer.invalidate()
            timer = nil
        }
    }
    
    func showNextPhoto() {
        if ((imageCarousel.currentItemIndex) == (imagesArray.count - 1) || valid == true) { // last carousel
            imageCarousel.scrollToItemAtIndex(imageCarousel.currentItemIndex - 1 , animated: true)
            valid = true
            if (imageCarousel.currentItemIndex == 0) {
                valid = false
            }
            pageControl.currentPage = imageCarousel.currentItemIndex - 1
        }
        else {
            imageCarousel.scrollToItemAtIndex(imageCarousel.currentItemIndex + 1 , animated: true)
            pageControl.currentPage = imageCarousel.currentItemIndex + 1
        }
        
    }
    
}


//MARK: - iCarouselDataSource
extension HomeViewController: iCarouselDataSource, iCarouselDelegate {
    
    func setUpCarousel() {
        imageCarousel.dataSource    = self
        imageCarousel.delegate      = self
        imageCarousel.type          = iCarouselType.Linear
        imageCarousel.pagingEnabled = true
        imageCarousel.clipsToBounds = true
    }
    
    func carouselDidEndDecelerating(carousel: iCarousel) {
        pageControl.currentPage = imageCarousel.currentItemIndex
    }
    
    func carouselWillBeginDecelerating(carousel: iCarousel) {
        pageControl.currentPage = imageCarousel.currentItemIndex
    }
    
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return imagesArray.count
    }
    
    @objc func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        let carouselView    = UIView(frame: CGRectMake(0, 0, imageCarousel.frame.width, imageCarousel.frame.height))
        let imageView       = UIImageView(frame: carouselView.frame)
        imageView.image = UIImage(named: imagesArray[index])
        carouselView.addSubview(imageView)
        return carouselView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.Spacing {
            return value * 1.1
        }
        return value
    }
    
}














