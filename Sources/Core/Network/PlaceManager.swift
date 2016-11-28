//
//  PlaceManager.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

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
// MARK: - Class -
//
//**************************************************************************************************

class PlaceManager: NSObject {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	class func validateResponse(_ result: JSON) -> Bool {
		return result["status"].string == "OK"
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	class func requestList(_ location: CLLocation, completion: @escaping CompletionSuccessPlaces ) -> Request? {
		let url = URL.places(location: location)
		return Alamofire.request(url, method: .get).responseJSON { response in
			guard let value = response.result.value, self.validateResponse(JSON(value)) else {
				completion(false, nil)
				return
			}
			let places = Place.arrayFromJson(JSON(value)["results"])
			completion(true, places)
		}
	}
	
	class func requestById(_ id: String, completion: @escaping CompletionSuccessPlace ) -> Request? {
		let url = URL.placeById(id)
		return Alamofire.request(url, method: .get).responseJSON { response in
			guard let value = response.result.value, self.validateResponse(JSON(value)),
				let place = Place(json: JSON(value)["result"]) else {
					completion(false, nil)
					return
			}
			completion(true, place)
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
