//
//  PlaceDetailViewControllerTests.swift
//  wascar
//
//  Created by Wagner Sales on 29/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceDetailViewControllerTests: WCARViewControllerTests {
	
	var viewController: PlaceDetailViewController {
		let indentifier = "PlaceDetailViewController"
		let storyboard = self.storyboard
		let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
		return viewController as! PlaceDetailViewController
	}
	
	func testViewViewModel(){
		let viewModel = PlaceDetailViewModel(place: self.place)
		let viewController = self.viewController
		viewController.viewModel = viewModel
		self.preloadView(viewController: viewController)
		XCTAssertNotNil(viewController.viewModel, "The view model should be not nil.")
		XCTAssertEqual(viewController.title, viewModel.title, "The view controller and view model title should be equal.")
	}

}
