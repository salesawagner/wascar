//
//  URLTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar
import CoreLocation
import SwiftyJSON

class URLTests: XCTestCase {
	
	var place: Place {
		let json = PlaceTests.placeDetailJSON
		return Place(json: json["result"])
	}
	
	var photo: Photo {
		return self.place.photos.first!
	}
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testListPlacesUrl() {
		let location = CLLocation(latitude: 37.332331, longitude: -122.031219)
		let urlString = URL.places(location: location)
		
		let url = NSURL(string: urlString)!
		let expectation = expectationWithDescription("GET \(url)")
		
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithURL(url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? NSHTTPURLResponse,
				responseURL = HTTPResponse.URL,
				MIMEType = HTTPResponse.MIMEType {
				XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "application/json", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			do {
				let jsonSerialized = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
				if let json = jsonSerialized as? [String : AnyObject] {
					if let status = json["status"] as? String {
						XCTAssertEqual(status, "OK", "Response data status should be OK")
					} else {
						XCTFail("JSON response was not right format")
					}
					if !(json["results"] is [[String : AnyObject]]) {
						XCTFail("Response data result was not valid array")
					}
				} else {
					XCTFail("Response data was not right structure")
				}
				
			} catch {
				XCTFail("Data can be not serialized")
			}
			
			expectation.fulfill()
		}
		
		task.resume()
		
		waitForExpectationsWithTimeout(task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
	func testPlaceDetailUrl() {
		let place = self.place
		let urlString = URL.placeById(place.id)
		
		let url = NSURL(string: urlString)!
		let expectation = expectationWithDescription("GET \(url)")
		
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithURL(url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? NSHTTPURLResponse,
				responseURL = HTTPResponse.URL,
				MIMEType = HTTPResponse.MIMEType {
				XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "application/json", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			do {
				let jsonSerialized = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
				if let json = jsonSerialized as? [String : AnyObject] {
					if let status = json["status"] as? String {
						XCTAssertEqual(status, "OK", "Response data status should be OK")
					} else {
						XCTFail("JSON response was not right format")
					}
					if !(json["result"] is [String : AnyObject]) {
						XCTFail("Response data result was not valid object")
					}
				} else {
					XCTFail("Response data was not right structure")
				}
				
			} catch {
				XCTFail("Data can be not serialized")
			}
			
			expectation.fulfill()
		}
		
		task.resume()
		
		waitForExpectationsWithTimeout(task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
	func testPhotoUrl() {
		let photo = self.photo
		let urlString = URL.photo(photo.reference)
		
		let url = NSURL(string: urlString)!
		let expectation = expectationWithDescription("GET \(url)")
		
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithURL(url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? NSHTTPURLResponse,
				MIMEType = HTTPResponse.MIMEType {
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "image/jpeg", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			expectation.fulfill()
		}
		
		task.resume()
		
		waitForExpectationsWithTimeout(task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
}
