//
//  PaybillsViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class PaybillsViewController: BaseViewController {
    
    var active = false
    
    @IBOutlet weak var detailContentView: UIView!
    @IBOutlet weak var dropdownIndicator: UIButton!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var tfReferenceNo: JVFloatLabeledTextField!
    @IBOutlet weak var tfAmount: JVFloatLabeledTextField!
    @IBOutlet weak var tfMerchant: JVFloatLabeledTextField!
    @IBOutlet weak var tfAccount: JVFloatLabeledTextField!
    
    let merchants = ["Meralco", "Manila Water", "Globe", "PLDT"]
    let accounts = ["SAVINGS-XXXX-0001", "SAVINGS-XXXX-0002", "CHECKING-XXXX-0001", "LOAN-XXXX-12343", "LOAN-XXXX-12223"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfAccount.attributedPlaceholder =
            NSAttributedString(string: "Account", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        customTextFieldDelegate(tfAccount)
        customTextFieldDelegate(tfMerchant)
        customTextFieldDelegate(tfReferenceNo)
        customTextFieldDelegate(tfAmount)
        customAccessoryView(tfAmount)
        
        customPickerView(accounts, textField: tfAccount)
        customPickerView(merchants, textField: tfMerchant)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        customNavigationTitleView(cColor.redFade(), title: "Pay Bills", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        signOutButton()
    }
    
    @IBAction func showDetailedAccount(sender: UIButton) {
        let rotation = self.active ? 0 : CGFloat(M_PI_2)
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: .AllowAnimatedContent, animations: {
            self.dropdownIndicator.transform = CGAffineTransformMakeRotation(rotation)
            }, completion:  {completed in
                UIView.animateWithDuration(0.3, animations: {
                    if self.active {
                        self.accountView.frame = CGRectMake(0, 0, self.view.frame.size.width, 94)
                        self.detailContentView.frame = CGRectMake(0, 94, self.view.frame.size.width, self.detailContentView.frame.size.height)
                    } else {
                        self.accountView.frame = CGRectMake(0, 0, self.view.frame.size.width, 42)
                        self.detailContentView.frame = CGRectMake(0, 42, self.view.frame.size.width, self.detailContentView.frame.size.height)
                    }
                })
        })
        
         self.active = !self.active ? true : false
        
    }
    
    @IBAction func showAllAccounts(sender: AnyObject) {
        //showCustomPickerView(accounts, button: sender as! UIButton)
    }
    
    @IBAction func showAllMerchants(sender: AnyObject) {
        //showCustomPickerView(merchants, button: sender as! UIButton)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




