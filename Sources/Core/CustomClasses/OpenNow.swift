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
	case none
	case open
	case close
	
	func text() -> String {
		var text: String
		switch self {
			case .open:
				text = L.openNow
			case .close:
				text = L.closed
			default:
				text = ""
		}
		return text
	}
	
	func color() -> UIColor {
		var color: UIColor
		switch self {
			case .open:
				color = UIColor.WCARGreenColor()
			case .close:
				color = UIColor.WCARRedColor()
			default:
				color = UIColor.clear
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
	
	var label: UILabel = UILabel()

	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	override init(frame : CGRect) {
		super.init(frame : frame)
		self.setup()
	}
	
	convenience init() {
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
		self.setStatus(.none)
		
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
		label.font = UIFont.WCARFontWithSize(10)
		label.textColor = UIColor.white
		label.textAlignment = .center
		self.label = label
		self.addSubview(self.label)
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func setStatus(_ status: ViewType) {
		self.backgroundColor = status.color()
		self.label.text = status.text()
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************

}
