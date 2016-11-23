//
//  WCARViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

class WCARViewController: UIViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func setupUI() {
		self.view.backgroundColor = UIColor.WCARBackgroundColor()
	}
	
	internal func setupNavigation() {
		if let nav = self.navigationController {
			
			// Navigation bar appearance
			nav.navigationBar.barTintColor = UIColor.WCARBlueColor()
			nav.navigationBar.titleTextAttributes = [
				NSForegroundColorAttributeName: UIColor.whiteColor(),
				NSFontAttributeName: UIFont.WCARnavigationBarFont()
			]
			
			// Navigation bar remove shadow
			nav.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
			nav.navigationBar.shadowImage = UIImage()
			
			// Navigation bar remove translucent
			nav.navigationBar.translucent = false
			
			// Navigation bar add back button if need
			if nav.viewControllers.count > 0 {
				if nav.viewControllers.first != self {
					// Gesture
					nav.interactivePopGestureRecognizer?.enabled = true
					nav.interactivePopGestureRecognizer?.delegate = self
					
					let backImage = UIImage(named: "btn_back")!
					let backButton = UIButton(frame: CGRectMake(0,0,backImage.size.width,backImage.size.height))
					backButton.setImage(backImage, forState: .Normal)
					backButton.addTarget(self, action: #selector(self.pop), forControlEvents: .TouchUpInside)
					
					let backButtonItem = UIBarButtonItem(customView: backButton)
					self.navigationItem.leftBarButtonItem = backButtonItem
				}
			}
		}
	}
	
	internal func pop() {
		self.navigationController?.popViewControllerAnimated(true)
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setupNavigation()
		self.setupUI()
    }

}

//**********************************************************************************************************
//
// MARK: - Extension - UIGestureRecognizerDelegate
//
//**********************************************************************************************************

extension WCARViewController: UIGestureRecognizerDelegate {
	func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
	}
}
