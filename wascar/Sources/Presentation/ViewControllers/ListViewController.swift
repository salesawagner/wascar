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

private let kDetailSegue = "DetailSegue"

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
	
	var listVM: ListViewControllerVM?
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setupVM() {
		self.listVM = ListViewControllerVM(completion: { (success) in
			// TODO:
			self.tableView.reloadData()
		})
	}
	
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
		self.setupVM()
	}
	
	override func setupNavigation() {
		super.setupNavigation()
		self.title = "Repair List"
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == kDetailSegue {
			if let viewController = segue.destinationViewController as? DetailViewController {
				if let place = sender as? Place {
					viewController.place = place
				}
			}
		}
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDataSource
//
//**********************************************************************************************************

extension ListViewController: UITableViewDataSource {
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.listVM?.places.count ?? 0
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		var cell: UITableViewCell!
		if let myCell = tableView.dequeueReusableCellWithIdentifier(kListCellIdentifier) as? ListTableViewCell {
			if let places = self.listVM?.places {
				let place = places[indexPath.row]
				myCell.setup(ListTableViewCellVM(place: place))
			}
			cell = myCell
		} else {
			cell = UITableViewCell(style: .Default, reuseIdentifier: kListCellIdentifier)
		}
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
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.performSegueWithIdentifier(kDetailSegue, sender: Place())
	}
}
