//
//  TransactionsViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/19/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

	var transactions: [Transaction] = []
	
	@IBOutlet var tableView: UITableView! {
		didSet {
			transactions = Transaction.getTransactionsFromUserdefaults()
		}
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// Insert code here when user taps cell.
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
	
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return transactions.count
		//return transactions.couoverride nt
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
		
		if cell.textLabel != nil {
			cell.textLabel!.text = transactions[indexPath.row].amountString
		}
		
		if cell.detailTextLabel != nil {
			cell.detailTextLabel!.text = transactions[indexPath.row].toWhom
		}
		print("tableView cell content customized.")
		
		return cell
	}
	
	override func viewWillAppear(animated: Bool) {
		if let nc = self.navigationController{
			nc.navigationBarHidden = false
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Transactions"
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		//self.tableView.separatorInset = UIEdgeInsetsZero
	}
}
