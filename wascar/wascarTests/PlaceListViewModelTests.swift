//
//  PlaceListViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceListViewModelTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
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
			let placeCellViewModels = placeListViewModel.placeCellViewModels
			let placeDetailViewModels = placeListViewModel.placeDetailViewModels
			let expectedPlacesCount = 10
			XCTAssertTrue(placeCellViewModels.count == expectedPlacesCount, "The place cell view models count should be equal to \(expectedPlacesCount).")
			XCTAssertTrue(placeDetailViewModels.count == expectedPlacesCount, "The place detail view models count should be equal to \(expectedPlacesCount).")
		}
		
		self.waitForExpectationsWithTimeout(60, handler: nil)
	}
}
