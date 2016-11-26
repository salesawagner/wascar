//
//  PlaceListViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceListViewModelTests: WCARTest {
        
	func testInitialization() {
		let placeListViewModel = PlaceListViewModel()
		let placeCellViewModels = placeListViewModel.placeCellViewModels
		let placeDetailViewModels = placeListViewModel.placeDetailViewModels
		XCTAssertNotNil(placeListViewModel, "The place list view model should not be nil.")
		XCTAssertNotNil(placeCellViewModels, "The place cell view models should not be nil.")
		XCTAssertNotNil(placeDetailViewModels, "The place detail view model should not be nil.")
	}
	
	func testLoadPlaces() {
		let expectation = self.expectationWithDescription(#function)
		let placeListViewModel = PlaceListViewModelMock()
		
		placeListViewModel.loadPlaces { (success) in
			expectation.fulfill()
			let placeCellViewModels		= placeListViewModel.placeCellViewModels
			let placeDetailViewModels	= placeListViewModel.placeDetailViewModels
			XCTAssertGreaterThan(placeCellViewModels.count, 0, "The place cell view models count should be greater than 0")
			XCTAssertGreaterThan(placeDetailViewModels.count, 0, "The place detail view models count should be greater than 0")
			XCTAssertTrue(placeCellViewModels.count == placeDetailViewModels.count, "The place cell and detail view models count should be equal.")
		}
		
		self.waitForExpectationsWithTimeout(60, handler: nil)
	}
	
	func testLoadPlacesFail() {
		let expectation = self.expectationWithDescription(#function)
		let placeListViewModel = PlaceListViewModelMock()
		
		placeListViewModel.loadPlacesInvalid { (success) in
			expectation.fulfill()
			let placeCellViewModels		= placeListViewModel.placeCellViewModels
			let placeDetailViewModels	= placeListViewModel.placeDetailViewModels
			XCTAssertTrue(placeCellViewModels.count == 0, "The place cell view models count should be equal 0.")
			XCTAssertTrue(placeDetailViewModels.count == 0, "The place detail view models count should be equal 0.")
		}
		
		self.waitForExpectationsWithTimeout(60, handler: nil)
	}
}

