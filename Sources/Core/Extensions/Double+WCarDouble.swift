//
//  Double+WCarDouble.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

extension Double {
	func WCARmetersToString() -> String {
		var kms = ""
		if self < 1000 {
			kms = "< 1 km"
		} else {
			let distance = self/1000
			kms = String(format: "%.2f km", distance)
		}
		return kms
	}
}
