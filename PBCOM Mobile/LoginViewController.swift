//
//  LoginViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit
import LocalAuthentication

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
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(resignKeyboard))
        self.view.addGestureRecognizer(tap)
        
    }
    
    func resignKeyboard ()  {
        
        textFieldUserID.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        
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
    
    @IBAction func fingerScanLogin(sender: UIButton) {
        
        let authenticationContext = LAContext()
        
        
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
        }
        
        authenticationContext.evaluatePolicy(
            .DeviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Only awesome people are allowed",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                    print("Finger Print Key: \(authenticationContext.evaluatedPolicyDomainState!.base64EncodedStringWithOptions([]))")
                    
                }else {
                    
                    // Check if there is an error
                    if let error = error {
                        
                        let message = self.errorMessageForLAErrorCode(error.code)
//                        self.showAlertViewAfterEvaluatingPolicyWithMessage(message)
                        self.showAlertWithTitle("", message: (message))
                        
                    }
                    
                }
                
            })
    }
    
    func errorMessageForLAErrorCode( errorCode:Int ) -> String{
        
        var message = ""
        
        switch errorCode {
            
        case LAError.AppCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.AuthenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.InvalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.PasscodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.SystemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.TouchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.TouchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
            
        case LAError.UserCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.UserFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
            
        }
        
        return message
        
    }
    
    
 
    func navigateToAuthenticatedViewController(){
        
        loginAction(UIButton)
    }
    
    func showAlertViewIfNoBiometricSensorHasBeenDetected(){
        
        showAlertWithTitle("Error", message: "This device does not have a TouchID sensor.")
        
    }
    
    func showAlertWithTitle( title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.presentViewController(alertVC, animated: true, completion: nil)
            
        }
        
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
 
        textField.resignFirstResponder()
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
}
