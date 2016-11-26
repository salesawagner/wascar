//
//  WCARViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import SCLAlertView

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

	// SCLAlertView
	var loading: SCLAlertView?
	var loadingResponse: SCLAlertViewResponder?
	
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
	
	//*************************
	// MARK: Loading
	//*************************
	
	internal func startLoading(title: String = L.wait, subtitle : String = L.loading, cancelTitle : String? = nil) {
		if self.loading == nil {
			
			let app = SCLAlertView.SCLAppearance(showCloseButton: false)
			let loading = SCLAlertView(appearance: app)
			
			if let cancel = cancelTitle {
				loading.addButton(cancel, action: {
					self.stopLoading()
				})
			}
			
			self.loading = loading
			self.loadingResponse = loading.showWait(title, subTitle: subtitle, colorStyle: UIColor.WCARBlueColor().WCARColorToUInt())
			self.loadingResponse?.setDismissBlock({
				self.loadingDidClose()
			})
		}
	}
	
	internal func stopLoading() {
		if self.loading != nil {
			self.loadingResponse?.close()
			self.loading = nil
		}
	}
	
	internal func loadingDidClose() {
		self.loadingResponse = nil
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
