//
//  LoginViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var textFieldUserID : (UITextField)!
    @IBOutlet weak var textFieldPassword: (UITextField)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textFieldUserID.layer.cornerRadius = 5
        textFieldUserID.layer.borderWidth = 2
        textFieldPassword.layer.cornerRadius = 5
        textFieldPassword.layer.borderWidth = 2
        
        textFieldPassword.layer.borderColor = cColor.borderColortextField().CGColor
        textFieldUserID.layer.borderColor = cColor.borderColortextField().CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let tabBar = storyboard?.instantiateViewControllerWithIdentifier("PBCOMTabBarController") as! PBCOMTabBarController
        self.presentViewController(tabBar, animated: true, completion: nil)
    }
    
    @IBAction func backToMainMenu(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
