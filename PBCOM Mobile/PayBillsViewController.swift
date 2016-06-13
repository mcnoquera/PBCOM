//
//  PayBillsViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class PayBillsViewController: BaseTableViewController {

    let bvc = BaseViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationTitleView(cColor.orangeFade(), title: "Pay Bills", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        customBackButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableViewControllerDelegate and UITableViewControllerDataSource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewControllerWithIdentifier("EnrolledBillersViewController") as! EnrolledBillersViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            print("Index: \(indexPath.row)")
            break
        case 2:
            print("Index: \(indexPath.row)")
            break
        default:
            break
        }
    }
    
}
