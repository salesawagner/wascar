//
//  OpenNowTests.swift
//  wascar
//
//  Created by Wagner Sales on 28/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class OpenNowTests: XCTestCase {
	
	var openNowView: OpenNow!
	
	override func setUp() {
		super.setUp()
		self.openNowView = OpenNow()
	}
	
	func testInitialization() {
		let view = OpenNow()
		XCTAssertNotNil(view, "The open now view should not be nil.")
	}
	
	func testIfOpen() {
		self.openNowView.setStatus(.open)
		let labelText = self.openNowView.label.text
		let backgroundColor = self.openNowView.backgroundColor?.WCARColorToUInt()
		let text = ViewType.open.text()
		let color = ViewType.open.color().WCARColorToUInt()
		XCTAssertEqual(labelText, text, "The open now label text and text should be equal to \(text).")
		XCTAssertEqual(backgroundColor, color, "The open now color and color should be equal to \(color).")
	}
	
	func testIfClose() {
		self.openNowView.setStatus(.close)
		let labelText = self.openNowView.label.text
		let backgroundColor = self.openNowView.backgroundColor?.WCARColorToUInt()
		let text = ViewType.close.text()
		let color = ViewType.close.color().WCARColorToUInt()
		XCTAssertEqual(labelText, text, "The open now label text and text should be equal to \(text).")
		XCTAssertEqual(backgroundColor, color, "The open now color and color should be equal to \(color).")
	}
	
	func testIfNone() {
		self.openNowView.setStatus(.none)
		let labelText = self.openNowView.label.text
		let backgroundColor = self.openNowView.backgroundColor?.WCARColorToUInt()
		let text = ViewType.none.text()
		let color = ViewType.none.color().WCARColorToUInt()
		XCTAssertEqual(labelText, text, "The open now label text and text should be equal to \(text).")
		XCTAssertEqual(backgroundColor, color, "The open now color and color should be equal to \(color).")
	}
}
