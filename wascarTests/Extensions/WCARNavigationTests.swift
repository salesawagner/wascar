//
//  WCARNavigationTests.swift
//  wascar
//
//  Created by Wagner Sales on 28/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class WCARNavigationTests: XCTestCase {
	
	let rootView	= UIViewController()
	let secondView	= UIViewController()
	var navigation	= UINavigationController()
	
    override func setUp() {
        super.setUp()
    }
	
	override func tearDown() {
		super.tearDown()
		self.navigation = UINavigationController()
	}
	
	func testRooViewController() {
		self.navigation.viewControllers = [self.rootView, self.secondView]
		let navRootView = self.navigation.WCARrootViewController
		XCTAssertNotNil(navRootView, "The navigation root view controller should be not nil.")
		XCTAssertEqual(self.rootView, navRootView, "The navigation root and root view controller should be equal.")
	}

	func testRooViewControllerFail() {
		let navRootView = self.navigation.WCARrootViewController
		XCTAssertNil(navRootView, "The navigation root view controller should be nil.")
		XCTAssertNotEqual(self.rootView, navRootView, "The navigation root and root view controller should be not equal.")
	}
}
