//
//  BaseViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

let PBCOM_LOGO  = "CompanyLogo"
let BACK_ICO    = "Back"


enum NOTICATION_CENTER: String {
    case DismissHomeScreen = "DismissHomeScreen"
}


enum FONT: String {
    case helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
}

class BaseViewController: UIViewController {
    
    let cColor = CustomColor()
    var showKeyboard: Bool!
    
    //Accessory View Instance
    var tfDefault: UITextField!
    var textPicker: UITextField!
    
    //Picker View Instance
    let standardPickerY = 200 as CGFloat
    var backgroundView: UIView!
    var customPickerView : UIView!
    var okButton : UIButton!
    var cancelButton: UIButton!
    var pickerView: UIPickerView!
    var pickerContentArray = []
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Bar Status Style
    func setBarStatus(style: UIStatusBarStyle) {
        UIApplication.sharedApplication().statusBarStyle = style
    }
    
    
    //MARK: Navigation Bar
    func defaultNavigationTitleView(navBgColor: UIColor, isHideNavLine: Bool, isTranslucent: Bool) {
        /*
         Set Frame of Navigation Image.
         */
        let navigationImage = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        navigationImage.image = UIImage(named: PBCOM_LOGO)
        let workaroundImageView = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        workaroundImageView.addSubview(navigationImage)
        self.navigationItem.titleView = workaroundImageView
        
        /*
         Hide/Show the line image in Navigation Bar.
         */
        isHideNavLine ? self.navigationController?.navigationBar.hideBottomHairline() : self.navigationController?.navigationBar.showBottomHairline()
        
        /*
         Set Translucent Effect in Navigation Bar.
         */
        self.navigationController?.navigationBar.translucent = isTranslucent
    
    }
    
    
    func customNavigationTitleView(navBgColor: UIColor, title: String?, isHideNavLine: Bool, isTranslucent: Bool, navTextColor: UIColor?) {
        /*
         Set Bar Tint Color of Navigation Bar.
         */
        self.navigationController?.navigationBar.barTintColor = navBgColor
        
        /*
         Hide/Show the line image in Navigation Bar.
         */
        isHideNavLine ? self.navigationController?.navigationBar.hideBottomHairline() : self.navigationController?.navigationBar.showBottomHairline()
        
        /*
         Set Translucent Effect in Navigation Bar.
         */
        self.navigationController?.navigationBar.translucent = isTranslucent
        
        /*
         Set Title for Navigation Bar.
         */
        if title != nil {
            self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: FONT.helveticaNeueCondensedBold.rawValue, size: 20)!, NSForegroundColorAttributeName: navTextColor!]
            self.navigationItem.title = title
        }
    }
    
    
    //MARK: Logout
    func signOutButton() {
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(self.alertLogout))
    }
    
    func alertLogout() {
        self.customAlert("PBCOM Mobile", message: "Are you sure you want to Logout?")
        
    }
    
    func dismissViewController() {
        self.setBarStatus(.Default)
        let homeVC = storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        let navController = UINavigationController(rootViewController: homeVC)
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    //MARK: Custom Alert View
    func customAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewController()
        }
        alertController.addAction(openAction)
        self.presentViewController(alertController, animated: true, completion: nil)
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
    func customPickerView(contentArray: [String], textField: UITextField) {
        self.pickerContentArray = contentArray
        self.textPicker = textField
        
        let inputAccessoryView: UIView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, 210))
        inputAccessoryView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        let picker = UIPickerView(frame: CGRectMake(0, 20, 0, 0))
        picker.delegate = self
        inputAccessoryView.addSubview(picker)
        inputAccessoryView.addSubview(accessoryDoneClearButton()[0])
        inputAccessoryView.addSubview(accessoryDoneClearButton()[1])
        textField.inputView = inputAccessoryView
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
        inputAccessoryView.addSubview(accessoryDoneClearButton()[0])
        inputAccessoryView.addSubview(accessoryDoneClearButton()[1])
        textField.inputAccessoryView = inputAccessoryView
    }

    func dismissKeyboard() {
        tfDefault.resignFirstResponder()
        textPicker.resignFirstResponder()
    }
    
    func clearText() {
        tfDefault.text = ""
        textPicker.text = ""
    }
    
    //MARK: Accessory Buttons
    func accessoryDoneClearButton() -> [UIButton] {
        var buttons = [UIButton]()
        /*
         * Add Done Button
         **/
        let doneButton : UIButton = UIButton(frame: CGRectMake(self.view.frame.width - 80, 0, 80, 40))
        doneButton.setTitle("Done", forState: .Normal)
        doneButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        doneButton.setTitleColor(cColor.redFade(), forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        doneButton.addTarget(self, action: #selector(self.dismissKeyboard), forControlEvents: .TouchUpInside)
        /*
         * Add Clear Button
         **/
        let clearButton : UIButton = UIButton (frame: CGRectMake(0, 0, 80, 40))
        clearButton.setTitle("Clear", forState: .Normal)
        clearButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        clearButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        clearButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        clearButton.addTarget(self, action: #selector(self.clearText), forControlEvents: .TouchUpInside)
        
        buttons.append(doneButton)
        buttons.append(clearButton)
        
        return buttons
        
    }
}

//MARK: - UITextFieldDelegate
extension BaseViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK: - UIPickerViewDelegate & UIPickerViewDataSource
extension BaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContentArray.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UIView.animateWithDuration(0.2) { 
            self.textPicker.text = self.pickerContentArray[row] as? String
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel      = UILabel()
        pickerLabel.font = UIFont(name: FONT.helveticaNeueCondensedBold.rawValue, size: 20)
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.text = pickerContentArray[row] as? String
        return pickerLabel
    }
}

