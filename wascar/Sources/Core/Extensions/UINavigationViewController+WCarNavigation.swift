//
//  UINavigationViewController+WCarNavigation.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UINavigationController {
	var WCARrootViewController: UIViewController? {
		return self.viewControllers.first
	}
}