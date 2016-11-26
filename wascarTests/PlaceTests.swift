//
//  PlaceTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PlaceTests: WCARTest {
	
	func testWithPlacesJSON() {
		let places = Place.arrayFromJson(self.placesJSON["results"])
		let expected = 10
		XCTAssertEqual(places.count, expected, "The places count should be equal to \(expected).")
	}
	
	func testWithPlacesJSONFail() {
		let places = Place.arrayFromJson(self.invalidJSON)
		let expected = 0
		XCTAssertEqual(places.count, expected, "The places count should be equal to \(expected).")
	}
	
	func testWithPlaceDetailJSON() {
		let place = Place(json: self.placeDetailJSON["result"])
		XCTAssertNotNil(place, "The place should not be nil.")
	}
	
	func testWithPlaceDetailJSONFail() {
		let place = Place(json: self.invalidJSON)
		XCTAssertNil(place, "The place should be nil.")
	}
	
}
