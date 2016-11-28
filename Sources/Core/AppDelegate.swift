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

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Attributes
		let titleAtributes = [
			NSForegroundColorAttributeName: UIColor.white,
			NSFontAttributeName: UIFont.WCARnavigationBarFont()
		]
		// Navigation bar appearance
		let navAppearance = UINavigationBar.appearance()
		navAppearance.barTintColor = UIColor.WCARBlueColor()
		navAppearance.titleTextAttributes = titleAtributes
		navAppearance.isTranslucent = false
		// Navigation bar button appearance
		let barButtonAppearance = UIBarButtonItem.appearance()
		barButtonAppearance.setTitleTextAttributes(titleAtributes, for: UIControlState())
		return true
	}
}
