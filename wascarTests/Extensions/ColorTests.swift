//
//  ColorTests.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class ColorTests: XCTestCase {
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testBlueColor() {
		let color = UIColor.WCARBlueColor().WCARColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
	
	func testRedColor() {
		let color = UIColor.WCARRedColor().WCARColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
	
	func testGreenColor() {
		let color = UIColor.WCARGreenColor().WCARColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
	
	func testBackgroundColor() {
		let color = UIColor.WCARBackgroundColor().WCARColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
}
