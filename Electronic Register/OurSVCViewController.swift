//
//  OurSVCViewController.swift
//  Electronic Register
//
//  Created by Jasper Reddin on 10/19/15.
//  Copyright © 2015 Jasper Reddin. All rights reserved.
//

import UIKit

class OurSVCViewController: UISplitViewController, UISplitViewControllerDelegate {

	func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool{
		return true
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.delegate = self

        // Do any additional setup after loading the view.
//		self.preferredDisplayMode = UISplitViewControllerDisplayMode.PrimaryOverlay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
