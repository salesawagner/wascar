//
//  PlaceCellViewModelTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceCellViewModelTests: WCARTest {
	
	func testInitialization() {
		let placeCellViewModel = PlaceCellViewModel(place: self.place)
		XCTAssertNotNil(placeCellViewModel, "The place cell view model should not be nil.")
	}
	
}
