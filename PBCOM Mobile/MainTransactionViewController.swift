//
//  LocatorViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class MainTransactionViewController: BaseTableViewController {
    
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
        customNavigationTitleView(cColor.orangeFade(), title: "Transactions", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        signOutButton()
    }
    
    
    //MARK: UITableViewControllerDelegate and UITableViewControllerDataSource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewControllerWithIdentifier("PayBillsViewController") as! PayBillsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = storyboard?.instantiateViewControllerWithIdentifier("TransferViewController") as! TransferViewController
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            print("Index: \(indexPath.row)")
            break
        default:
            break
        }
    }
    
    
    
}
