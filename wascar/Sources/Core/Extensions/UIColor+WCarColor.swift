//
//  UIColor+WCarColor.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension UIColor {
	
	/**
	Construct a UIColor using an Int Value RGB formatted value and an alpha value
	
	- parameter r: Red Int value.
	- parameter g: Green Int value.
	- parameter b: Blue Int Value
	- parameter a: Alpha value.
	
	- returns: An UIColor instance that represent the required color
	*/
	public convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
		
		let red		= CGFloat(r) / 255.0
		let green	= CGFloat(g) / 255.0
		let blue	= CGFloat(b) / 255.0
		self.init(red: red, green: green, blue: blue, alpha: CGFloat(a))
	}
	
	/**
	Create custom color using r: 29, g: 29, b: 38, a: 0.03
	
	- returns: Background color.
	*/
	public class func WCARBackgroundColor() -> UIColor {
		return UIColor(r: 248, g: 248, b: 248, a: 1)
	}
	
	/**
	Create custom color using r: 29, g: 29, b: 38, a: 0.03
	
	- returns: Background color.
	*/
	public class func WCARBlueColor() -> UIColor {
		return UIColor(r: 75, g: 95, b: 131, a: 1)
	}
}
