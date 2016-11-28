//
//  WCARTest.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wascar

class WCARViewControllerTests: WCARTest {
	
	var storyboard: UIStoryboard {
		let bundle = Bundle(for: wascar.PlaceListViewController)
		return UIStoryboard(name: "Main", bundle: bundle)
	}
	
	func preloadView(viewController: UIViewController) {
		UIApplication.shared.keyWindow!.rootViewController = viewController
		viewController.preloadView()
	}
}
