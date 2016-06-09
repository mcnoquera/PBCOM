//
//  ProfileViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/7/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let navigationImage = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        navigationImage.image = UIImage(named: "CompanyLogo")
        let workaroundImageView = UIImageView(frame: CGRectMake(0, 0, 140, 40))
        workaroundImageView.addSubview(navigationImage)
        self.navigationItem.titleView = workaroundImageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: UITableViewControllerDelegate and UITableViewControllerDataSource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("PesoSavingsAccountViewController") as! PesoSavingsAccountViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
           
        }
    }
    
    

}
