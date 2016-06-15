//
//  LocatorViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class MainTransactionViewController: BaseViewController {
    
    @IBOutlet weak var segmentContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        segmentContentView.backgroundColor = cColor.redFade()
        customNavigationTitleView(cColor.redFade(), title: "Transactions", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        signOutButton()
    }
    
    
    //MARK: UITableViewControllerDelegate and UITableViewControllerDataSource
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        switch indexPath.row {
//        case 0:
//            let vc = storyboard?.instantiateViewControllerWithIdentifier("PayBillsViewController") as! PayBillsViewController
//            self.navigationController?.pushViewController(vc, animated: true)
//            break
//        case 1:
//            let vc = storyboard?.instantiateViewControllerWithIdentifier("TransferViewController") as! TransferViewController
//            self.navigationController?.pushViewController(vc, animated: true)
//            break
//        case 2:
//            print("Index: \(indexPath.row)")
//            break
//        default:
//            break
//        }
//    }
    
}

//MARK: - SlideNavigationControllerDelegate
extension MainTransactionViewController: SlideNavigationControllerDelegate {
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool {
        return true
    }
    
    func setUpMenuSlideView() {
        SlideNavigationController.sharedInstance().panGestureSideOffset        = 50
        SlideNavigationController.sharedInstance().enableShadow                = true
        SlideNavigationController.sharedInstance().portraitSlideOffset         = 60
        SlideNavigationController.sharedInstance().landscapeSlideOffset        = 60
        SlideNavigationController.sharedInstance().menuRevealAnimationDuration = 0.19
    }
}
