//
//  AppDelegate.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Attributes
		let titleAtributes = [
			NSForegroundColorAttributeName: UIColor.whiteColor(),
			NSFontAttributeName: UIFont.WCARnavigationBarFont()
		]
		// Navigation bar appearance
		let navAppearance = UINavigationBar.appearance()
		navAppearance.barTintColor = UIColor.WCARBlueColor()
		navAppearance.titleTextAttributes = titleAtributes
		navAppearance.translucent = false
		// Navigation bar button appearance
		let barButtonAppearance = UIBarButtonItem.appearance()
		barButtonAppearance.setTitleTextAttributes(titleAtributes, forState: .Normal)
		return true
	}
}
