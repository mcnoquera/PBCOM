//
//  PayBillsViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class PayBillsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 244/255.0, green: 128/255.0, blue: 80/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.hideBottomHairline()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBold", size: 20)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title = "Pay Bills"
        customBackButton()
    }
    
    //MARK: Dismiss Button
    func customBackButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back"), style: .Plain, target: self, action: #selector(PayBillsViewController.dismissViewController))
    }
    
    func dismissViewController() {
        self.navigationController?.popViewControllerAnimated(true)
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
