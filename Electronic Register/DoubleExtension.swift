//
//  DoubleExtension.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/22/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import Foundation

extension Double {
	var currencyString: String {
		get {
			let formatter = NSNumberFormatter()
			formatter.maximumFractionDigits = 2
			formatter.numberStyle = .CurrencyStyle
			if let string = formatter.stringFromNumber(self){
				return string
			}else{
				return "$0.00"
			}
		}
	}
}