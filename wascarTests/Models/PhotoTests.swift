//
//  PhotoTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class PhotoTests: WCARTest {
		
	func testWithPhotosJSON() {
		let photos = Photo.arrayFromJson(self.photosJSON)
		XCTAssertGreaterThan(photos.count, 0, "The photos should bet greater than 0.")
	}
	
	func testWithPhotosJSONFail() {
		let photos = Photo.arrayFromJson(self.invalidJSON)
		XCTAssertEqual(photos.count, 0, "The photos should bet equal 0.")
	}
	
	func testWithPhotoJSON() {
		let photo = Photo(json: self.photoJSON)
		XCTAssertNotNil(photo, "The photo should not be nil.")
	}
	
	func testWithPlaceDetailJSONFail() {
		let photo = Photo(json: self.invalidJSON)
		XCTAssertNil(photo, "The photo should be nil.")
	}
	
}
