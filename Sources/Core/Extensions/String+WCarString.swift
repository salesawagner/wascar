//
//  String+WCarString.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension String {
	var WCARlocalized: String {
		return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
	}
	func WCARreplace(_ target: String, withString: String) -> String {
		return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
	}
	func WCARopeningHours() -> String {
		var weekdays = self.lowercased()
		weekdays = weekdays.WCARreplace("monday", withString: L.monday)
		weekdays = weekdays.WCARreplace("tuesday", withString: L.tuesday)
		weekdays = weekdays.WCARreplace("wednesday", withString: L.wednesday)
		weekdays = weekdays.WCARreplace("thursday", withString: L.thursday)
		weekdays = weekdays.WCARreplace("friday", withString: L.friday)
		weekdays = weekdays.WCARreplace("saturday", withString: L.saturday)
		weekdays = weekdays.WCARreplace("sunday", withString: L.sunday)
		weekdays = weekdays.WCARreplace("closed", withString: L.closed)
		return weekdays.capitalized
	}
}
