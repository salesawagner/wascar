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

class URLTests: WCARTest {
	
	func testListPlacesUrl() {
		let expectation = self.expectation(description: #function)
		let location = CLLocation(latitude: 37.332331, longitude: -122.031219)
		let urlString = URL.places(location: location)
		let url = URL(string: urlString)!
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? HTTPURLResponse,
				let responseURL = HTTPResponse.url,
				let MIMEType = HTTPResponse.mimeType {
				XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "application/json", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			do {
				let jsonSerialized = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
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
		
		waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
	func testPlaceDetailUrl() {
		let expectation = self.expectation(description: #function)
		let place = self.place
		let urlString = URL.placeById(place.id)
		let url = URL(string: urlString)!
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? HTTPURLResponse,
				let responseURL = HTTPResponse.url,
				let MIMEType = HTTPResponse.mimeType {
				XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "application/json", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			do {
				let jsonSerialized = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
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
		
		waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
	func testPhotoUrl() {
		let expectation = self.expectation(description: #function)
		let photo = self.photo
		let urlString = URL.photo(photo.reference)
		let url = URL(string: urlString)!
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? HTTPURLResponse,
				let MIMEType = HTTPResponse.mimeType {
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "image/jpeg", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			expectation.fulfill()
		}
		
		task.resume()
		
		waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
	
}
