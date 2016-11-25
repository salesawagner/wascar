//
//  PlaceListViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import SwiftLocation

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

private let kDetailSegue	= "DetailSegue"
private let kNoGpsSegue		= "NoGpsSegue"
private let kNoPlacesSegue	= "NoPlacesSegue"

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
	var refreshControl: UIRefreshControl!
	var openedViewController: UIViewController?
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setupPullRefresh() {
		self.refreshControl = UIRefreshControl()
		self.refreshControl.addTarget(self, action: #selector(self.didRefresh(_:)), forControlEvents: .ValueChanged)
		self.tableView.addSubview(self.refreshControl)
	}
	
	private func loadPlaces(loading: Bool = true, completion: CompletionSuccess? = nil) {
		if loading {
			self.startLoading()
		}
		self.viewModel.loadPlaces { (success) in
			// Stop loading
			self.stopLoading()
			
			// Dismiss view controller if need
			self.dismissIfNeed()
			
			// No location test
			if !success && Location.lastLocation == nil{
				self.performSegueWithIdentifier(kNoGpsSegue, sender: nil)
				return
			}
			
			// No places test
			if self.viewModel.placeCellViewModels.count == 0 {
				self.performSegueWithIdentifier(kNoPlacesSegue, sender: nil)
			} else {
				self.tableView.reloadData()
			}
			
			completion?(success: success)
		}
	}
	
	private func dismissIfNeed(completion: (() -> Void)? = nil) {
		self.openedViewController?.dismissViewControllerAnimated(true, completion: { 
			self.openedViewController = nil
			completion?()
		})
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func didRefresh(refreshControl: UIRefreshControl) {
		self.loadPlaces(false) { (success) in
			self.refreshControl.endRefreshing()
		}
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupPullRefresh()
		self.loadPlaces()
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
		} else if segue.identifier == kNoPlacesSegue {
			self.openedViewController = segue.destinationViewController
			if let navigation = segue.destinationViewController as? UINavigationController {
				if let viewController = navigation.WCARrootViewController as? NoPlacesViewController{
					viewController.delegate = self
					viewController.title = self.viewModel.title
				}
			}
		} else if segue.identifier == kNoGpsSegue {
			self.openedViewController = segue.destinationViewController
			if let navigation = segue.destinationViewController as? UINavigationController {
				if let viewController = navigation.WCARrootViewController{
					viewController.title = self.viewModel.title
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

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDelegate
//
//**********************************************************************************************************

extension PlaceListViewController: NoPlacesViewControllerDelegate {
	func loadButtonTapped() {
		self.dismissIfNeed { 
			self.loadPlaces()
		}
	}
}
