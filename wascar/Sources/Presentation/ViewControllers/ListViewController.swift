//
//  ListViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

class ListViewController: WCARTableViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func setupNavigation() {
		super.setupNavigation()
		self.title = "Repair List"
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDataSource
//
//**********************************************************************************************************

extension ListViewController: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		var cell: UITableViewCell!
		if let myCell = tableView.dequeueReusableCellWithIdentifier(kListCellIdentifier) as? ListTableViewCell {
			cell = myCell
		} else {
			cell = UITableViewCell(style: .Default, reuseIdentifier: kListCellIdentifier)
		}
		
//		cell.textLabel?.text = "blablablalalb"
		
		return cell
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDelegate
//
//**********************************************************************************************************

extension ListViewController: UITableViewDelegate {
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 130
	}
}
