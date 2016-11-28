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
		let bundle = Bundle(for: WCARTest.self)
		let filePath = bundle.path(forResource: "places", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
		return JSON(data: data!)
	}
	
	var placeDetailJSON: JSON {
		let bundle = Bundle(for: WCARTest.self)
		let filePath = bundle.path(forResource: "placeDetail", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
		return JSON(data: data!)
	}
	
	var photosJSON: JSON {
		let bundle = Bundle(for: WCARTest.self)
		let filePath = bundle.path(forResource: "photos", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
		return JSON(data: data!)
	}
	
	var photoJSON: JSON {
		let bundle = Bundle(for: WCARTest.self)
		let filePath = bundle.path(forResource: "photo", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
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
}
