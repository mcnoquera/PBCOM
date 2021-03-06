//
//  EnrolledBIllersViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class EnrolledBillersViewController: BaseTableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        customNavigationTitleView(cColor.redFade(), title: "Enrolled Billers", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        customBackButton()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
