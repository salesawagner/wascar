//
//  PlaceDetailViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceDetailViewModelTests: WCARTest {
	
	func testInitialization() {
		let placeCellViewModel = PlaceDetailViewModel(place: self.place)
		XCTAssertNotNil(placeCellViewModel, "The place detail view model should not be nil.")
	}
	
	func testUpdatePlace() {
		let expectation = self.expectation(description: #function)
		let placeDetailViewModel = PlaceDetailViewModel(place: self.place)
		
		placeDetailViewModel.loadPlaceById { (success) in
			expectation.fulfill()
			XCTAssert(success, "The success should be true.")
		}
		
		self.waitForExpectations(timeout: 60, handler: nil)
	}
	
	func testUpdatePlaceFail() {
		let expectation = self.expectation(description: #function)
		let placeDetailViewModel = PlaceDetailViewModel(place: self.place)
		placeDetailViewModel.placeId = ""
		
		placeDetailViewModel.loadPlaceById { (success) in
			expectation.fulfill()
			XCTAssert(success == false, "The success should be false.")
		}
		
		self.waitForExpectations(timeout: 60, handler: nil)
	}
}
