//
//  AddTransactionViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/20/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {
	@IBOutlet weak var amountTextField: UITextField?
	@IBOutlet weak var toTextField: UITextField?
	@IBOutlet weak var forTextField: UITextField?
	
	@IBAction func onTap(sender: AnyObject) {
		dismissKeyboard()
	}
	
	func dismissKeyboard(){
		amountTextField?.resignFirstResponder()
		toTextField?.resignFirstResponder()
		forTextField?.resignFirstResponder()
	}
	
	@IBAction func onAddTransaction(sender: UIButton){
		switch sender.titleLabel?.text ?? "" {
			case "Add Expense":
				let transaction = Transaction()
				let amount = Double(amountTextField?.text ?? "")
				if amount != nil && toTextField?.text != nil && forTextField?.text != nil {
					transaction.amount = -(amount!)
					transaction.toWhom = toTextField!.text!
					transaction.forWhat = forTextField!.text!
//					print("\(transaction)")
					transaction.addToDatabase()
					close()
				}else{
					errorAlert()
				}
			case "Add Income":
				let transaction = Transaction()
				let amount = Double(amountTextField?.text ?? "")
				if amount != nil && forTextField?.text != nil {
					transaction.amount = amount!
					transaction.toWhom = "Income"
					transaction.forWhat = forTextField!.text!
//					print("\(transaction)")
					transaction.addToDatabase()
					close()
				}else{
					errorAlert()
				}
			default:
			break
		}
	}
	
	func errorAlert(){
		 let alert = UIAlertController(title: "Error", message: "Could not convert decimal to string.", preferredStyle: UIAlertControllerStyle.Alert)
		let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel) { (UIAlertAction) -> Void in }
		alert.addAction(alertAction)
		presentViewController(alert, animated: true) { () -> Void in }
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		amountTextField?.becomeFirstResponder()
    }
	
	func close(){
		if let parent = parentViewController as? AddTransactionNavigationController{
			parent.previousViewController.dismissViewControllerAnimated(true, completion: nil)
		}
	}
	
	@IBAction func cancel(sender: AnyObject) {
		close()
		
		dismissKeyboard()
	}
}
