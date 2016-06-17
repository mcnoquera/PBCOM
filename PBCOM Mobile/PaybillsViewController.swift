//
//  PaybillsViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class PaybillsViewController: BaseTableViewController {
    
    let merchants = ["Meralco", "Manila Water", "Globe", "PLDT"]
    let accounts = ["SAVINGS-XXXX-0001", "SAVINGS-XXXX-0002", "CHECKING-XXXX-0001", "LOAN-XXXX-12343", "LOAN-XXXX-12223"]
    
    @IBOutlet weak var tfAmount: UITextField!
    @IBOutlet weak var tfReferenceNo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        customNavigationTitleView(cColor.redFade(), title: "Enrolled Billers", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        customAccessoryView(tfAmount)
        customBackButton()
        customTextFieldDelegate(tfReferenceNo)
        customTextFieldDelegate(tfAmount)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAccounts(sender: AnyObject) {
        showCustomPickerView(accounts, button: sender as! UIButton)
    }
    
    @IBAction func showMerchants(sender: AnyObject) {
        showCustomPickerView(merchants, button: sender as! UIButton)
    }
    
}


