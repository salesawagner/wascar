//
//  Photo.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import SwiftyJSON

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

//**************************************************************************************************
//
// MARK: - Class - Place
//
//**************************************************************************************************

class Photo: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var url: String
	var reference: String
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init?(json: JSON) {
		guard let reference = json["photo_reference"].string, !reference.isEmpty else {
			return nil
		}
		self.reference = reference
		let width = json["width"].intValue
		self.url = URL.photo(reference, maxWidth: min(width, 400))
	}
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	class func arrayFromJson(_ json: JSON) -> [Photo] {
		var photos = [Photo]()
		for photoJson in json.arrayValue {
			if let photo = Photo(json: photoJson) {
				photos.append(photo)
			}
		}
		return photos
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
