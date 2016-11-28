//
//  UIImageView+WCarImageView.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
	func WCARsetImageWithUrl(_ photoUrl: String) {
		if let url = Foundation.URL(string: photoUrl) {
			let placeHolder = UIImage(named:"img_header")
			self.af_setImage(
				withURL: url,
				placeholderImage: placeHolder,
				imageTransition: .crossDissolve(0.25)
			)
		}
	}
}
