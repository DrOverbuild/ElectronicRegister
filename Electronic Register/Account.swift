//
//  Account.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/22/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class Account: NSObject {

	var balance: Double {
		get {
			return NSUserDefaults.standardUserDefaults().doubleForKey("account.balance") ?? 0.0
		}
		set {
			NSUserDefaults.standardUserDefaults().setDouble(newValue, forKey: "account.balance")
		}
	}
	
	var tithesDue: Double {
		get {
			return NSUserDefaults.standardUserDefaults().doubleForKey("account.tithes") ?? 0.0
		}
		set {
			NSUserDefaults.standardUserDefaults().setDouble(newValue, forKey: "account.tithes")
		}
	}
	
	var totalExpense: Double{
		get {
			let transactions = Transaction.getTransactionsFromUserdefaults()
			var total: Double = 0.0
			for transaction in transactions {
				if transaction.amount < 0.0{
					total += transaction.amount
				}
			}
			return total
		}
	}
	
	var totalIncome: Double{
		get {
			let transactions = Transaction.getTransactionsFromUserdefaults()
			var total: Double = 0.0
			for transaction in transactions {
				if transaction.amount > 0.0{
					total += transaction.amount
				}
			}
			return total
		}
	}
}
