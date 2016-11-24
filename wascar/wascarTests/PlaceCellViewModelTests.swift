//
//  PlaceCellViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceCellViewModelTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
	func testInitialization() {
		let place = Place(json: PlaceTests.placeDetailJSON)
		let placeCellViewModel = PlaceCellViewModel(place: place)
		XCTAssertNotNil(placeCellViewModel, "The place cell view model should not be nil.")
	}
	
}
