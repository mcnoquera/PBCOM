//
//  TransactionViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/8/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class TransactionViewController: BaseViewController {

    var transactions : [Transaction] = []
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        setUpTransactionPerAccount()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.customNavigationTitleView(cColor.redFade(), title: "Account Details", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        self.headerView.backgroundColor = cColor.redFade()
        customBackButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTransactionPerAccount() {
        let transactionOne = Transaction()
        transactionOne.transactionType = "ATM Withdrawal"
        transactionOne.transactionDate = "28 Apr"
        transactionOne.amount = "P2,500.00"
        
        let transactionTwo = Transaction()
        transactionTwo.transactionType = "Service Charge"
        transactionTwo.transactionDate = "01 May"
        transactionTwo.amount = "P500.00"
        
        let transactionThree = Transaction()
        transactionThree.transactionType = "Payment"
        transactionThree.transactionDate = "04 May"
        transactionThree.amount = "P1,500.00"
        
        let transactionFour = Transaction()
        transactionFour.transactionType = "ATM Withdrawal"
        transactionFour.transactionDate = "15 May"
        transactionFour.amount = "P100.00"
    
        let transactionFive = Transaction()
        transactionFive.transactionType = "Co. Credits"
        transactionFive.transactionDate = "20 May"
        transactionFive.amount = "P500.00"
        
        let transactionSix = Transaction()
        transactionSix.transactionType = "ATM Withdrawal"
        transactionSix.transactionDate = "01 Jun"
        transactionSix.amount = "P500.00"
        
        transactions.append(transactionOne)
        transactions.append(transactionTwo)
        transactions.append(transactionThree)
        transactions.append(transactionFour)
        transactions.append(transactionFive)
        transactions.append(transactionSix)
        
    }
    

}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(10, 5, tableView.frame.size.width, 18))
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 14)
        label.text =  "Transaction History"
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1.0)
        return view
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TransactionCell", forIndexPath: indexPath) as UITableViewCell
        let transactionType = cell.viewWithTag(10) as! UILabel
        let transactionDate = cell.viewWithTag(11) as! UILabel
        let amount = cell.viewWithTag(12) as! UILabel
        
        let transaction = transactions[indexPath.row] as Transaction
        transactionType.text = transaction.transactionType
        transactionDate.text = transaction.transactionDate
        amount.text = transaction.amount
        
        return cell
    }
}


extension UINavigationBar {
    
    func hideBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.hidden = true
    }
    
    func showBottomHairline() {
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.hidden = false
    }
    
    private func hairlineImageViewInNavigationBar(view: UIView) -> UIImageView? {
        if view.isKindOfClass(UIImageView) && view.bounds.height <= 1.0 {
            return (view as! UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
                return imageView
            }
        }
        
        return nil
    }
    
}