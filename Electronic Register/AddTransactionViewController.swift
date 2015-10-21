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
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		amountTextField?.becomeFirstResponder()
    }
	
	@IBAction func cancel(sender: AnyObject) {
		
		if let parent = parentViewController as? AddTransactionNavigationController{
			parent.previousViewController.dismissViewControllerAnimated(true, completion: nil)
		}
		
		dismissKeyboard()
	}
}
