//
//  PlaceListViewController.swift
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
// MARK: - Class - PlaceListViewController
//
//**************************************************************************************************

class PlaceListViewController: WCARTableViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var viewModel: PlaceListViewModel = PlaceListViewModel()
	
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
		self.viewModel.loadPlaces { (success) in
			self.tableView.reloadData()
		}
	}
	
	override func setupNavigation() {
		super.setupNavigation()
		self.title = self.viewModel.title
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == kDetailSegue {
			if let viewController = segue.destinationViewController as? PlaceDetailViewController {
				if let viewModel = sender as? PlaceDetailViewModel {
					viewController.viewModel = viewModel
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

extension PlaceListViewController: UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.placeCellViewModels.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		var cell: UITableViewCell!
		if let myCell = tableView.dequeueReusableCellWithIdentifier(kPlaceCellIdentifier) as? PlaceCell {
			let placeCellViewModels = self.viewModel.placeCellViewModels
			let cellViewModel = placeCellViewModels[indexPath.row]
			myCell.setup(cellViewModel)
			cell = myCell
		} else {
			cell = UITableViewCell(style: .Default, reuseIdentifier: kPlaceCellIdentifier)
		}
		return cell
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDelegate
//
//**********************************************************************************************************

extension PlaceListViewController: UITableViewDelegate {
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 130
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let detailViewModels = self.viewModel.placeDetailViewModels
		let detailViewModel = detailViewModels[indexPath.row]
		self.performSegueWithIdentifier(kDetailSegue, sender: detailViewModel)
	}
}
