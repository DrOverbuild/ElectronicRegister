//
//  ViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/18/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var balanceValueLabel: UILabel!
	@IBOutlet weak var totalIncomeValueLabel: UILabel!
	@IBOutlet weak var totalExpensesValueLabel: UILabel!
	@IBOutlet weak var tithesDueValueLabel: UILabel!
	
	override func viewWillAppear(animated: Bool) {
		if let nc = self.navigationController{
			nc.navigationBarHidden = true
		}
		
		balanceValueLabel.text = Account.balance.currencyString
		totalExpensesValueLabel.text = Account.totalExpense.currencyString
		totalIncomeValueLabel.text = Account.totalIncome.currencyString
		tithesDueValueLabel.text = Account.tithesDue.currencyString
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let id = segue.identifier{
			if id == "add transaction"{
				if let atnc = segue.destinationViewController as? AddTransactionNavigationController{
					atnc.previousViewController = self
				}
			}
		}
	}
}

