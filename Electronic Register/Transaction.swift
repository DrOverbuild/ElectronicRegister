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
	
	var amountString: String {
		get {
			let formatter = NSNumberFormatter()
			formatter.maximumFractionDigits = 2
			formatter.numberStyle = .CurrencyStyle
			if let string = formatter.stringFromNumber(self.amount){
				return string
			}else{
				return "$0.00"
			}
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
}
