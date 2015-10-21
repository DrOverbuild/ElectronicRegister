//
//  ViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/18/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func addExpense(sender: AnyObject) {
		let transaction = Transaction()
		transaction.amount = -3.422
		transaction.forWhat = "Pizza"
		transaction.toWhom = "Pizza Hut"
		
		var trans = Transaction.getTransactionsFromUserdefaults()
		
		trans = [transaction] + trans
		
		Transaction.setTransactionsFromUserDefaults(trans)
	
		print("Added expense with amount: \(transaction.amountString)")
	}
	
	@IBAction func addIncome(sender: AnyObject) {
		let transaction = Transaction()
		transaction.amount = 45.422
		transaction.forWhat = "Pizza"
		transaction.toWhom = "Pizza Hut"
		
		var trans = Transaction.getTransactionsFromUserdefaults()
		
		trans = [transaction] + trans
		
		Transaction.setTransactionsFromUserDefaults(trans)
		
		print("Added income with amount: \(transaction.amountString)")
	}
	
	override func viewWillAppear(animated: Bool) {
		if let nc = self.navigationController{
			nc.navigationBarHidden = true
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

