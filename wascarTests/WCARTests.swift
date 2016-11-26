//
//  WCARTest.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar
import SwiftyJSON

class WCARTest: XCTestCase {
	
	var placesJSON: JSON {
		let bundle = NSBundle(forClass: WCARTest.self)
		let filePath = bundle.pathForResource("places", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	var placeDetailJSON: JSON {
		let bundle = NSBundle(forClass: WCARTest.self)
		let filePath = bundle.pathForResource("placeDetail", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	var photosJSON: JSON {
		let bundle = NSBundle(forClass: WCARTest.self)
		let filePath = bundle.pathForResource("photos", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	var photoJSON: JSON {
		let bundle = NSBundle(forClass: WCARTest.self)
		let filePath = bundle.pathForResource("photo", ofType: "json")
		let data = NSData(contentsOfFile: filePath!)
		return JSON(data: data!)
	}
	
	var invalidJSON: JSON {
		return JSON([:])
	}
	
	var place: Place {
		return Place(json: self.placeDetailJSON["result"])!
	}
	
	var photo: Photo {
		return Photo(json: self.photoJSON)!
	}
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
