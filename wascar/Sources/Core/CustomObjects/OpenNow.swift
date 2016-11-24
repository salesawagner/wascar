//
//  OpenNow.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
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

enum ViewType {
	case None
	case Open
	case Close
	
	func text() -> String {
		var text: String
		switch self {
			case .Open:
				text = L.openNow
			case .Close:
				text = L.closed
			default:
				text = ""
		}
		return text
	}
	
	func color() -> UIColor {
		var color: UIColor
		switch self {
		case .Open:
			color = UIColor.WCAROpenNowGreenColor()
		case .Close:
			color = UIColor.WCAROpenNowRedColor()
		default:
			color = UIColor.clearColor()
		}
		return color
	}
}

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

@IBDesignable class OpenNow: UIView {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	@IBInspectable var cornerRadius: CGFloat = 10 {
		didSet {
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0
		}
	}
	
	private var label: UILabel = UILabel()

	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	override init (frame : CGRect) {
		super.init(frame : frame)
		self.setup()
	}
	
	convenience init () {
		self.init(frame:CGRect.zero)
		self.setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setup() {
		self.cornerRadius = 4
		self.setStatus(.None)
		
		let label = UILabel(frame: CGRectMake(0, 0, self.frame.width, self.frame.height))
		label.font = UIFont.WCARFontWithSize(10)
		label.textColor = UIColor.whiteColor()
		label.textAlignment = .Center
		self.label = label
		self.addSubview(self.label)
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func setStatus(status: ViewType) {
		self.backgroundColor = status.color()
		self.label.text = status.text()
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************

}
