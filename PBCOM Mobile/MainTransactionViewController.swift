//
//  LocatorViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class MainTransactionViewController: UITableViewController {
    
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
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red:244/255.0, green: 128/255.0, blue: 80/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.hideBottomHairline()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBold", size: 20)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title = "Transactions"
        signOutButton()
    }
    
    func signOutButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(MainTransactionViewController.dismissViewController))
    }
    
    func dismissViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
