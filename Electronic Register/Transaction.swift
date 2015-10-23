//
//  Transaction.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/19/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

@objc(Transaction)
class Transaction: NSObject, NSCoding {
	
	var amount: Double = 0.0
	var toWhom: String = ""
	var forWhat: String = ""
	var date: NSDate = NSDate()
	
	override var description: String {
		get {
			return "Transaction: \(amountString), to \(toWhom), for \(forWhat)"
		}
	}
	
	var amountString: String {
		get {
			return amount.currencyString
		}
	}
	
	func addToDatabase(){
		var transactions = Transaction.getTransactionsFromUserdefaults()
		transactions = [self] + transactions
		Transaction.setTransactionsFromUserDefaults(transactions)
		Account.balance += self.amount
		
		if self.amount > 0 {
			Account.tithesDue += 0.1 * amount
		}
	}
	
	override init(){ super.init()}
	
	required init(coder aDecoder: NSCoder) {
		
		self.amount	= aDecoder.decodeDoubleForKey("amount")
		
		if let toWhom = aDecoder.decodeObjectForKey("toWhom") as? String {
			self.toWhom = toWhom
		}
		
		if let forWhat = aDecoder.decodeObjectForKey("forWhat") as? String {
			self.forWhat = forWhat
		}
		
		if let date = aDecoder.decodeObjectForKey("date") as? NSDate {
			self.date = date
		}
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeDouble(amount, forKey: "amount")
		aCoder.encodeObject(toWhom, forKey: "toWhom")
		aCoder.encodeObject(forWhat, forKey: "forWhat")
		aCoder.encodeObject(date, forKey: "date")
	}
	
	class func getTransactionsFromUserdefaults() -> [Transaction]{
		if let data = NSUserDefaults.standardUserDefaults().objectForKey("transactions") as? NSData {
			return NSKeyedUnarchiver.unarchiveObjectWithData(data) as! [Transaction]
		}else{
			return []
		}
	}
	
	class func setTransactionsFromUserDefaults(transactions: [Transaction]){
		let myData = NSKeyedArchiver.archivedDataWithRootObject(transactions)
		NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "transactions")
	}
}
