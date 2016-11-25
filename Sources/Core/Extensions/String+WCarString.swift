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
		return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
	}
}