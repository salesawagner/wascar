//
//  PlaceDetailViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceDetailViewModelTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testInitialization() {
		let place = Place(json: PlaceTests.placeDetailJSON)
		let placeCellViewModel = PlaceDetailViewModel(place: place)
		XCTAssertNotNil(placeCellViewModel, "The place detail view model should not be nil.")
	}
	
	func testUpdatePlaces() {
		let expectation = self.expectationWithDescription(#function)
		let place = Place(json: PlaceTests.placeDetailJSON)
		let placeDetailViewModel = PlaceDetailViewModelMock(place: place)
		
		placeDetailViewModel.loadPlaceById { (success) in
			expectation.fulfill()
			XCTAssertNotNil(placeDetailViewModel.openingHours, "The openingHours should not be nil.")
		}
		
		self.waitForExpectationsWithTimeout(60, handler: nil)
	}
}
