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
	func WCARsetImageWithUrl(photoUrl: String) {
		let url = NSURL(string: photoUrl) ?? NSURL()
		let placeHolder = UIImage(named:"img_header")
		self.af_setImageWithURL(
			url,
			placeholderImage: placeHolder,
			imageTransition: .CrossDissolve(0.25)
		)
	}
}