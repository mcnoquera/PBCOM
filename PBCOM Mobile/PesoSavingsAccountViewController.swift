//
//  PesoSavingsAccountViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class PesoSavingsAccountViewController: UITableViewController {
    
    let baseViewController = BaseViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBold", size: 20)!]
        self.navigationItem.title = "Peso Savings"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTransactionHistory(sender: AnyObject) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: UITableViewControllerDelegate and UITableViewControllerDataSource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 2 {

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
    
    
}
