//
//  MenuViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/15/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    let profileArray = ["Accounts", "Transaction"]
    let imageArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:
    func popToRootAndSwitchToViewController(vc : UIViewController) {
        SlideNavigationController.sharedInstance().popToRootAndSwitchToViewController(vc,
                                                                                      withSlideOutAnimation: true,
                                                                                      andCompletion: nil)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return profileArray.count
        default:
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell")! as UITableViewCell
        let title = cell.viewWithTag(2) as! UILabel
        title.text = self.profileArray[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
               let account = self.storyboard?.instantiateViewControllerWithIdentifier("AccountsViewController") as! AccountsViewController
               self.popToRootAndSwitchToViewController(account)
            case 1:
                let transaction = self.storyboard?.instantiateViewControllerWithIdentifier("MainTransactionViewController") as! MainTransactionViewController
                self.popToRootAndSwitchToViewController(transaction)
            default:
                break
            }
        }
        
    }
}


