//
//  PlaceListViewControllerTests.swift
//  wascar
//
//  Created by Wagner Sales on 28/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceListViewControllerTests: WCARViewControllerTests {
	
	var viewController: PlaceListViewController {
		let indentifier = "PlaceListViewController"
		let storyboard = self.storyboard
		let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
		return viewController as! PlaceListViewController
	}
	
	func testViewViewModel(){
		let viewModel = PlaceListViewModel()
		let viewController = self.viewController
		self.preloadView(viewController: viewController)
		XCTAssertNotNil(viewController.viewModel, "The view model should be not nil.")
		XCTAssertEqual(viewController.title, viewModel.title, "The view controller and view model title should be equal.")
	}
	
	func testLoadPlace(){
		let expectation = self.expectation(description: #function)
		let viewController = self.viewController
		viewController.viewModel = PlaceListViewModelPlacesMock()
		self.preloadView(viewController: viewController)
		viewController.loadPlaces(completion: { (success) in
			let cellsCount	= viewController.viewModel.placeCellViewModels.count
			let rowsCount	= viewController.tableView.numberOfRows(inSection: 0)
			XCTAssertEqual(cellsCount, rowsCount, "The rows and cell count should br equal.")
			expectation.fulfill()
		})
		self.waitForExpectations(timeout: 60, handler: nil)
	}

}
