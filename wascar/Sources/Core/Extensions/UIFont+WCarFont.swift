//
//  UIFont+WCarFont.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIFont {
	static func WCARnavigationBarFont() -> UIFont {
		let fontSize: CGFloat = 17
		return UIFont(name: "Avenir-Medium", size: fontSize) ?? UIFont.systemFontOfSize(fontSize)
	}
}