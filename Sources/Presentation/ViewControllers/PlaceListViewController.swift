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
	var firstTime: Bool = true
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setupPullRefresh() {
		self.refreshControl = UIRefreshControl()
		self.refreshControl.addTarget(self, action: #selector(self.didRefresh(_:)), for: .valueChanged)
		self.tableView.addSubview(self.refreshControl)
	}
	
	fileprivate func dismissIfNeed(_ completion: Completion? = nil) {
		self.openedViewController?.dismiss(animated: true, completion: {
			self.openedViewController = nil
			completion?()
		})
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func loadPlaces(_ loading: Bool = true, completion: CompletionSuccess? = nil) {
		if loading {
			self.startLoading()
		}
		self.viewModel.loadPlaces { (success) in
			// Dismiss view controller if need
			self.dismissIfNeed()
			// No location check
			if !success && Location.lastLocation == nil{
				self.stopLoading(hasError: false)
				self.performSegue(withIdentifier: kNoGpsSegue, sender: nil)
				return
			}
			// No places check
			if self.viewModel.placeCellViewModels.count == 0 {
				self.stopLoading(hasError: false)
				self.performSegue(withIdentifier: kNoPlacesSegue, sender: nil)
				return
			}
			self.tableView.reloadData()
			self.stopLoading(hasError: !success)
			completion?(success)
		}
	}
	
	internal func didRefresh(_ refreshControl: UIRefreshControl) {
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
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if self.firstTime {
			self.loadPlaces()
			self.firstTime = false
		}
	}
	
	override func setupUI() {
		super.setupUI()
		self.title = self.viewModel.title
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == kDetailSegue {
			if let viewController = segue.destination as? PlaceDetailViewController {
				if let viewModel = sender as? PlaceDetailViewModel {
					viewController.viewModel = viewModel
				}
			}
		} else if segue.identifier == kNoPlacesSegue {
			self.openedViewController = segue.destination
			if let navigation = segue.destination as? UINavigationController {
				if let viewController = navigation.WCARrootViewController as? NoPlacesViewController{
					viewController.delegate = self
					viewController.title = self.viewModel.title
				}
			}
		} else if segue.identifier == kNoGpsSegue {
			self.openedViewController = segue.destination
			if let navigation = segue.destination as? UINavigationController {
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

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.placeCellViewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell!
		if let myCell = tableView.dequeueReusableCell(withIdentifier: kPlaceCellIdentifier) as? PlaceCell {
			let placeCellViewModels = self.viewModel.placeCellViewModels
			let cellViewModel = placeCellViewModels[indexPath.row]
			myCell.setup(cellViewModel)
			cell = myCell
		} else {
			cell = UITableViewCell(style: .default, reuseIdentifier: kPlaceCellIdentifier)
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
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 130
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailViewModels = self.viewModel.placeDetailViewModels
		let detailViewModel = detailViewModels[indexPath.row]
		self.performSegue(withIdentifier: kDetailSegue, sender: detailViewModel)
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
