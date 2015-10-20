//
//  TransactionsViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/19/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class TransactionsViewController: UITableViewController{

	var transactions: [Transaction] = []
	
//	@IBOutlet var tableView: UITableView! {
//		didSet {
//			if let trans = NSUserDefaults.standardUserDefaults().arrayForKey("transactions") as? [Transaction] {
//				transactions = trans
//			}
//		}
//	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// Insert code here when user taps cell.
	}
	
	
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
		//return transactions.couoverride nt
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")!
		
		if cell.textLabel != nil {
			cell.textLabel!.text = "hello"//transactions[indexPath.row].amountString
		}
		
		if cell.detailTextLabel != nil {
			cell.detailTextLabel!.text = "hello"//transactions[indexPath.row].toWhom
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
		//self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
}
