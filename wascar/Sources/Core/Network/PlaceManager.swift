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
		let url = URL.places("car_repair", location: location)
		return Alamofire.request(.GET, url, encoding: .JSON).responseJSON { response in
			if let value = response.result.value {
				let json = JSON(value)
				if self.validateResponse(json) {
					let places = Place.arrayFromJson(json["results"])
					completion(success: true, places: places)
				} else {
					completion(success: false, places: nil)
				}
			} else {
				completion(success: false, places: nil)
			}
		}
	}
	
	class func requestById(id: String, completion: (success: Bool, place: Place?) -> Void ) -> Request? {
		let url = URL.placeById(id)
		return Alamofire.request(.GET, url, encoding: .JSON).responseJSON { response in
			if let value = response.result.value {
				let json = JSON(value)
				if self.validateResponse(json) {
					completion(success: true, place: Place(json: json["result"]))
				} else {
					completion(success: false, place: nil)
				}
			} else {
				completion(success: false, place: nil)
			}
		}
	}
	
	class func calculateDistance(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, completion: (distance: Distance?) -> Void ) -> Void {
		let network = NetworkManager()
		var parameters = [String : String]()
		parameters["origins"] = "\(origin.latitude),\(origin.longitude)"
		parameters["destinations"] = "\(destination.latitude),\(destination.longitude)"
		network.request(.GET,
		                stringURL: URL.googleMatrixURL,
		                parameters: parameters,
		                header: nil,
		                needsHeaderAuthorization: false) { (response) in
							switch response {
							case let .SuccessResponseHandler(response):
								completion(distance: Distance(response))
							case .FailureResponseHandler(_):
								completion(distance: nil)
							}
							
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
