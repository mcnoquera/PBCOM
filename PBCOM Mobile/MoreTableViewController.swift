//
//  MoreTableViewController.swift
//  PBCOM Mobile
//
//  Created by Reggie Cabalo on 10/06/2016.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class MoreTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.clearColor()
        
        tableView.scrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationTitleView(cColor.redFade(), title: "More", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        signOutButton()
    }
    
}
