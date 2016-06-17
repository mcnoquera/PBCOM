//
//  LoginViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var textFieldUserID : (UITextField)!
    @IBOutlet weak var textFieldPassword: (UITextField)!
    @IBOutlet weak var closeLogin: (UIButton)!
    
    
    
//    weak var activeTextField: UITextField?
//    var kPreferredTextFieldToKeyboardOffset: CGFloat = 20.0
//    var keyboardFrame: CGRect = CGRect.null
//    var keyboardIsShowing: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
//        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
//        
        
        textFieldUserID.layer.cornerRadius = 5
        textFieldUserID.layer.borderWidth = 2
        textFieldPassword.layer.cornerRadius = 5
        textFieldPassword.layer.borderWidth = 2
        
        textFieldPassword.layer.borderColor = cColor.borderColortextField().CGColor
        textFieldUserID.layer.borderColor = cColor.borderColortextField().CGColor

    
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(resignKeyboard))
        self.view.addGestureRecognizer(tap)
        
    }
    
    
    func keyboardWillShow(notification:NSNotification) {
        
        
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
      
        
    }
    
//    func adjustingHeight(show:Bool, notification:NSNotification)
//    {
//        var userInfo = notification.userInfo!
//        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
//        let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
//        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
//        
//        
//        if keyboardFrame.origin.y >= UIScreen.mainScreen().bounds.size.height {
//            scro
//        } else {
//            self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
//        }
//        UIView.animateWithDuration(duration,
//                                   delay: NSTimeInterval(0),
//                                   options: animationCurve,
//                                   animations: { self.view.layoutIfNeeded() },
//                                   completion: nil)
//
//    }
    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
//    
    
    
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
        resignKeyboard()
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

//MARK: - UIScrollViewDelegate
extension LoginViewController: UIScrollViewDelegate {
    
}


//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
//        self.view.frame.origin.y -= 60
        animateViewMoving(true, moveValue: 60)
        closeLogin.hidden = true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
//        self.view.frame.origin.y += 60
        animateViewMoving(false, moveValue: 60)
        textField.resignFirstResponder()
        closeLogin.hidden = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }

    
}
