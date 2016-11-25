//
//  URL.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import CoreLocation

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

private let kPlaceType		= "car_repair"
private let kPlaceRadius	= 5000
private let kPhotoMaxWidth	= 400

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class - URL
//
//**************************************************************************************************

class URL {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	static var apiKey: String {
		return "AIzaSyBQdUB4ud-KqBpEVuq7gfLuc9c_f0q1RKY"
	}
	
	static var placeApiUrl: String {
		return "https://maps.googleapis.com/maps/api/place"
	}
	
	static var photoBaseUrl: String {
		return "\(self.placeApiUrl)/photo"
	}
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	class func baseUrl(locationType: String) -> String {
		return "\(self.placeApiUrl)/\(locationType)/json"
	}
	
	class func places(placeType: String = kPlaceType, location: CLLocation) -> String {
		let coordinate = location.coordinate
		let latitude = coordinate.latitude
		let longitude = coordinate.longitude

		var url = "\(self.baseUrl("nearbysearch"))"
		url += "?location=\(String(format: "%f,%f", latitude, longitude))"
		url += "&radius=\(kPlaceRadius)"
		url += "&type=\(placeType)"
		url += "&key=\(self.apiKey)"
		return url
	}
	
	class func placeById(id: String) -> String {
		var url = self.baseUrl("details")
		url += "?placeid=\(id)"
		url += "&key=\(self.apiKey)"
		return url
	}
	
	class func photo(reference: String, maxWidth: Int = kPhotoMaxWidth) -> String {
		var url = self.photoBaseUrl
		url += "?maxwidth=\(maxWidth)"
		url += "&photoreference=\(reference)"
		url += "&key=\(self.apiKey)"
		return url
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}

