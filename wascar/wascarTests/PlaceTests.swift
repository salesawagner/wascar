//
//  PlaceTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar
import SwiftyJSON

class PlaceTests: XCTestCase {
	
	class var placesJSON: JSON {
		let bundle = NSBundle(forClass: PlaceTests.self)
		let filePath = bundle.pathForResource("places", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	class var placesInvalidJSON: JSON {
		let bundle = NSBundle(forClass: PlaceTests.self)
		let filePath = bundle.pathForResource("placesInvalid", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	class var placeDetailJSON: JSON {
		let bundle = NSBundle(forClass: PlaceTests.self)
		let filePath = bundle.pathForResource("placeDetail", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
	func testWithPlacesJSON() {
		let json = PlaceTests.placesJSON
		let places = Place.arrayFromJson(json["results"])
		let expectedPlacesCount = 10
		XCTAssertNotNil(places, "The places should not be nil.")
		XCTAssertTrue(places.count == expectedPlacesCount, "The places count should be equal to \(expectedPlacesCount).")
	}
	
	func testWithPlaceDetailJSON() {
		let json = PlaceTests.placeDetailJSON
		let place = Place(json: json["result"])
		XCTAssertNotNil(place, "The place should not be nil.")
	}
	
}
