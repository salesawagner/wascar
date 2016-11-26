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
	
	class func validateResponse(result: JSON) -> Bool {
		return result["status"].string == "OK"
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	class func requestList(location: CLLocation, completion: (success: Bool, places: [Place]?) -> Void ) -> Request? {
		let url = URL.places(location: location)
		return Alamofire.request(.GET, url, encoding: .JSON).responseJSON { response in
			
			guard let value = response.result.value where self.validateResponse(JSON(value)) else {
				completion(success: false, places: nil)
				return
			}
			
			let places = Place.arrayFromJson(JSON(value)["results"])
			completion(success: true, places: places)
		}
	}
	
	class func requestById(id: String, completion: (success: Bool, place: Place?) -> Void ) -> Request? {
		let url = URL.placeById(id)
		return Alamofire.request(.GET, url, encoding: .JSON).responseJSON { response in
			
			guard let value = response.result.value where self.validateResponse(JSON(value)),
				let place = Place(json: JSON(value)["result"]) else {
				completion(success: false, place: nil)
				return
			}
			completion(success: true, place: place)
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
