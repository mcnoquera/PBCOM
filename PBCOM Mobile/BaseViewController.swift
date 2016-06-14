//
//  BaseViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

let PBCOM_LOGO  = "CompanyLogo"
let BACK_ICO    = "Back"

enum FONT: String {
    case helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
}

class BaseViewController: UIViewController {
    
    let cColor = CustomColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    
    //MARK: Bar Status Style
    func setBarStatus(style: UIStatusBarStyle) {
        UIApplication.sharedApplication().statusBarStyle = style
    }
    
    
    //MARK: Navigation Bar
    func defaultNavigationTitleView(navBgColor: UIColor, isHideNavLine: Bool, isTranslucent: Bool) {
        /*
         Set Frame of Navigation Image.
         */
        let navigationImage = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        navigationImage.image = UIImage(named: PBCOM_LOGO)
        let workaroundImageView = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        workaroundImageView.addSubview(navigationImage)
        self.navigationItem.titleView = workaroundImageView
        
        /*
         Hide/Show the line image in Navigation Bar.
         */
        isHideNavLine ? self.navigationController?.navigationBar.hideBottomHairline() : self.navigationController?.navigationBar.showBottomHairline()
        
        /*
         Set Translucent Effect in Navigation Bar.
         */
        self.navigationController?.navigationBar.translucent = isTranslucent
    
    }
    
    
    func customNavigationTitleView(navBgColor: UIColor, title: String?, isHideNavLine: Bool, isTranslucent: Bool, navTextColor: UIColor?) {
        /*
         Set Bar Tint Color of Navigation Bar.
         */
        self.navigationController?.navigationBar.barTintColor = navBgColor
        
        /*
         Hide/Show the line image in Navigation Bar.
         */
        isHideNavLine ? self.navigationController?.navigationBar.hideBottomHairline() : self.navigationController?.navigationBar.showBottomHairline()
        
        /*
         Set Translucent Effect in Navigation Bar.
         */
        self.navigationController?.navigationBar.translucent = isTranslucent
        
        /*
         Set Title for Navigation Bar.
         */
        if title != nil {
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: FONT.helveticaNeueCondensedBold.rawValue, size: 20)!, NSForegroundColorAttributeName: navTextColor!]
            self.navigationItem.title = title
        }
    }
    
    
    //MARK: Logout
    func signOutButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(self.alertLogout))
    }
    
    func alertLogout() {
        self.customAlert("PBCOM Mobile", message: "Are you sure you want to Logout?")
        
    }
    
    func dismissViewController() {
        self.setBarStatus(.Default)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Custom Alert View
    func customAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewController()
        }
        alertController.addAction(openAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    //MARK: Custom Back Button
    func customBackButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: BACK_ICO), style: .Plain, target: self, action: #selector(self.dismissBackViewController))
    }
    
    func dismissBackViewController() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
