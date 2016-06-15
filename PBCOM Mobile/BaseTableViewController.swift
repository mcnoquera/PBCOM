//
//  BaseTableViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/13/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    let cColor = CustomColor()
    
    let PBCOM_LOGO = "CompanyLogo"
    
    //Accessory View Instance
    var tfDefault: UITextField!
    
    //Picker View Instance
    let standardPickerY = 250 as CGFloat
    var backgroundView: UIView!
    var customPickerView : UIView!
    var okButton : UIButton!
    var cancelButton: UIButton!
    var pickerView: UIPickerView!
    var pickerContentArray = []
    var buttonPicker: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    func customNavigationTitleView(navBgColor: UIColor, title: String?, isHideNavLine: Bool, isTranslucent: Bool, navTextColor: UIColor?) {
        /*
         * Set Bar Tint Color of Navigation Bar.
        **/
        self.navigationController?.navigationBar.barTintColor = navBgColor
        
        /*
         * Hide/Show the line image in Navigation Bar.
        **/
        isHideNavLine ? self.navigationController?.navigationBar.hideBottomHairline() : self.navigationController?.navigationBar.showBottomHairline()
        
        /*
         * Set Translucent Effect in Navigation Bar.
        **/
        self.navigationController?.navigationBar.translucent = isTranslucent
        
        /*
         * Set Title for Navigation Bar.
        **/
        if title != nil {
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: FONT.helveticaNeueCondensedBold.rawValue, size: 20)!, NSForegroundColorAttributeName: navTextColor!]
            self.navigationItem.title = title
        }
    }

    //MARK: Bar Status Style
    func setBarStatus(style: UIStatusBarStyle) {
        UIApplication.sharedApplication().statusBarStyle = style
    }
    
    //MARK: Logout
    func signOutButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(self.alertLogout))
    }
    
    func alertLogout() {
        let alertController = UIAlertController(title: "PBCOM Mobile",
                                                message: "Are you sure you want to Logout?",
                                                preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewController()
        }
        alertController.addAction(openAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        self.setBarStatus(.Default)
        let homeVC = storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        let navController = UINavigationController(rootViewController: homeVC)
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    //MARK: Custom Back Button
    func customBackButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: BACK_ICO), style: .Plain, target: self, action: #selector(self.dismissBackViewController))
    }
    
    func dismissBackViewController() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: Custom Picker View
    func showCustomPickerView(contentArray: [String], button: UIButton) {
        self.buttonPicker = button
        self.pickerContentArray = contentArray
        self.backgroundView = UIView(frame: self.view.bounds)
        self.backgroundView.backgroundColor = UIColor.blackColor()
        self.backgroundView.alpha           = 0
        
        self.customPickerView = NSBundle.mainBundle().loadNibNamed("CustomPicker", owner: self, options: nil)[0] as! UIView
        self.customPickerView.frame = CGRectMake(view.frame.origin.x, view.frame.height, view.frame.width, standardPickerY)
        
        self.okButton = self.customPickerView.viewWithTag(1) as! UIButton
        self.cancelButton = self.customPickerView.viewWithTag(2) as! UIButton
        self.pickerView = self.customPickerView.viewWithTag(3) as! UIPickerView
        self.pickerView.delegate = self
        toogleViewContent(true)
        
        self.okButton.addTarget(self, action: #selector(self.tooglePickerView(_:)), forControlEvents: .TouchUpInside)
        self.cancelButton.addTarget(self, action: #selector(self.tooglePickerView(_:)), forControlEvents: .TouchUpInside)
    }
    
    func tooglePickerView(sender: UIButton) {
        sender.tag == 1 ? toogleViewContent(false) : toogleViewContent(false)
    }
    
    func toogleViewContent(tag: Bool) {
        if tag == true {
            self.view.addSubview(self.backgroundView)
            self.view.addSubview(self.customPickerView)
            self.view.bringSubviewToFront(self.customPickerView)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.backgroundView.alpha = 0.5
                self.customPickerView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.height - self.customPickerView.frame.height,
                    self.view.frame.width, self.customPickerView.frame.height)
            })
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.backgroundView.alpha = 0
                self.customPickerView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.height,
                    self.view.frame.width, self.standardPickerY)
                }, completion: { (Bool) -> Void in
                    self.customPickerView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
            })
        }
    }
    
    //MARK: Custom Text Field
    func customTextFieldDelegate(textField: UITextField) {
        textField.delegate = self
    }
    
    //MARK: Accessory View
    func customAccessoryView(textField: UITextField) {
        self.tfDefault = textField
        let inputAccessoryView: UIView = UIView(frame: CGRectMake(0, 0, 100, 40))
        inputAccessoryView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        /*
         * Add Done Button
         **/
        let doneButton : UIButton = UIButton(frame: CGRectMake(self.view.frame.width - 80, 0, 80, 40))
        doneButton.setTitle("Done", forState: .Normal)
        doneButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        doneButton.setTitleColor(cColor.redFade(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        doneButton.addTarget(self, action: #selector(self.dismissKeyboard), forControlEvents: .TouchUpInside)
        inputAccessoryView.addSubview(doneButton)
        
        /*
         * Add Clear Button
         **/
        let clearButton : UIButton = UIButton (frame: CGRectMake(0, 0, 80, 40))
        clearButton.setTitle("Clear", forState: .Normal)
        clearButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        clearButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        clearButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        clearButton.addTarget(self, action: #selector(self.clearText), forControlEvents: .TouchUpInside)
        inputAccessoryView.addSubview(clearButton)
        
        textField.inputAccessoryView = inputAccessoryView
    }
    
    //MARK: Keyboard Accessory Methods
    func dismissKeyboard() {
        tfDefault.resignFirstResponder()
    }
    
    func clearText() {
        tfDefault.text = ""
    }
}

//MARK: - UITextFieldDelegate
extension BaseTableViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - UIPickerViewDelegate & UIPickerViewDataSource
extension BaseTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContentArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.buttonPicker.tintColor = UIColor.blackColor()
        self.buttonPicker.setTitle(pickerContentArray[row] as? String, forState: .Normal)
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel      = UILabel()
        pickerLabel.font = UIFont(name: FONT.helveticaNeueCondensedBold.rawValue, size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = pickerContentArray[row] as? String
        return pickerLabel
    }
}




