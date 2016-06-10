//
//  LoginViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldUserID : (UITextField)!
    @IBOutlet weak var textFieldPassword: (UITextField)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let navigationImage = UIImageView(frame: CGRectMake(0, 0, 140, 40))
//        navigationImage.image = UIImage(named: "CompanyLogo")
//        let workaroundImageView = UIImageView(frame: CGRectMake(0, 0, 140, 40))
//        workaroundImageView.addSubview(navigationImage)
//        self.navigationItem.titleView = workaroundImageView
        
        
        textFieldUserID.layer.cornerRadius = 5
        textFieldUserID.layer.borderWidth = 2
        textFieldPassword.layer.cornerRadius = 5
        textFieldPassword.layer.borderWidth = 2
        
        
        textFieldPassword.layer.borderColor = UIColor(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1).CGColor
        textFieldUserID.layer.borderColor = UIColor(red: 233/255.0, green: 233/255.0, blue: 233/255.0, alpha: 1).CGColor
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
