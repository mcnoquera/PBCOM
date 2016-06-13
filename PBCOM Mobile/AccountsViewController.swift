//
//  AccountsViewController.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/9/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class AccountsViewController: BaseViewController {
    
    let sectionHeader = ["Savings and Checking Account", "Personal Loan Account", "Credit Card"]
    var savingsAndCheckingAccounts: [Account] = []
    var personalLoanAccounts: [Account] = []
    var creditCardAccounts: [Account] = []
    
    @IBOutlet weak var accountTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.automaticallyAdjustsScrollViewInsets = false
        
        setUpStaticSavingsandCheckingAccounts()
        setUpStaticPersonalLoanAccounts()
        setUpStaticCreditCardAccounts()
        accountTableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.customNavigationTitleView(cColor.orangeFade(), title: "Accounts", isHideNavLine: true, isTranslucent: false, navTextColor: UIColor.whiteColor())
        signOutButton()
    }
    
    
    func setUpStaticSavingsandCheckingAccounts() {
        let savingsAccountOne = Account()
        savingsAccountOne.accountType = "SAVINGS ACCOUNT"
        savingsAccountOne.accountNumber = "07811291"
        savingsAccountOne.amountTag = "Available Amount"
        savingsAccountOne.amount = "PHP 3,000.00"
        
        let savingsAccountTwo = Account()
        savingsAccountTwo.accountType = "SAVINGS ACCOUNT"
        savingsAccountTwo.accountNumber = "12324533"
        savingsAccountTwo.amountTag = "Available Amount"
        savingsAccountTwo.amount = "PHP 12,000.00"

        let checkingsAccountOne = Account()
        checkingsAccountOne.accountType = "CHECKING ACCOUNT"
        checkingsAccountOne.accountNumber = "45463281"
        checkingsAccountOne.amountTag = "Available Amount"
        checkingsAccountOne.amount = "PHP 35,000.00"
        
        savingsAndCheckingAccounts.append(savingsAccountOne)
        savingsAndCheckingAccounts.append(savingsAccountTwo)
        savingsAndCheckingAccounts.append(checkingsAccountOne)
    }
    
    func setUpStaticPersonalLoanAccounts() {
        let personalAccountOne = Account()
        personalAccountOne.accountType = "PBCOM PERSONAL LOAN"
        personalAccountOne.accountNumber = "9092173441324432"
        personalAccountOne.amountTag = "Available Limit"
        personalAccountOne.amount = "PHP 5,000.00"
        
        personalLoanAccounts.append(personalAccountOne)
    }
    
    func setUpStaticCreditCardAccounts() {
        let creditCardAccountOne = Account()
        creditCardAccountOne.accountType = "PBCOM CREDIT CARD"
        creditCardAccountOne.accountNumber = "2133454656433"
        creditCardAccountOne.amountTag = "Available Limit"
        creditCardAccountOne.amount = "PHP 10,210.00"
        
        creditCardAccounts.append(creditCardAccountOne)
    }
    
}


//MARK: - UITableViewDelegate & UITableViewDataSource
extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 18))
        let label = UILabel(frame: CGRectMake(10, 5, tableView.frame.size.width, 18))
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 14)
        label.text =  sectionHeader[section]
        view.addSubview(label)
        view.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1.0)
        return view
    }
    
    
    
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return savingsAndCheckingAccounts.count
        case 1:
            return personalLoanAccounts.count
        case 2:
            return creditCardAccounts.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AccountCell")! as UITableViewCell
        let accountType = cell.viewWithTag(10) as! UILabel
        let accountNumber = cell.viewWithTag(11) as! UILabel
        let amountTag = cell.viewWithTag(12) as! UILabel
        let amount = cell.viewWithTag(13) as! UILabel
        
        switch indexPath.section {
        case 0:
            let account = savingsAndCheckingAccounts[indexPath.row]
            accountType.text = account.accountType
            accountNumber.text = account.accountNumber
            amountTag.text = account.amountTag
            amount.text = account.amount
        case 1:
            let account = personalLoanAccounts[indexPath.row]
            accountType.text = account.accountType
            accountNumber.text = account.accountNumber
            amountTag.text = account.amountTag
            amount.text = account.amount
        case 2:
            let account = creditCardAccounts[indexPath.row]
            accountType.text = account.accountType
            accountNumber.text = account.accountNumber
            amountTag.text = account.amountTag
            amount.text = account.amount
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tvc = storyboard?.instantiateViewControllerWithIdentifier("TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(tvc, animated: true)
    }
    
}


