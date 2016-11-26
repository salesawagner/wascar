//
//  Place.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftLocation
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
// MARK: - Class - Place
//
//**************************************************************************************************

class Place: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	// Info
	var id: String
	var name: String
	var address: String
	var rating: Float
	
	// Location
	var location: CLLocation
	var distance: Double {
		var distance: Double = 0
		if let userLocation = Location.lastLocation {
			distance = userLocation.distanceFromLocation(self.location)
		}
		return distance
	}
	
	// Open hours
	var openNow: Bool
	var period = [String]()
	
	// Photo
	var icon: String
	var photos: [Photo]
	var photoUrl: String {
		var photoUrl = ""
		if self.photos.count > 0 {
			let photo = self.photos.first!
			photoUrl = photo.url
		} else if !self.icon.isEmpty {
			photoUrl = self.icon
		}
		return photoUrl
	}
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init?(json: JSON) {
		guard let id = json["place_id"].string where !id.isEmpty,
			let name = json["name"].string where !name.isEmpty else {
			return nil
		}
		
		// Info
		self.id = id
		self.name = name
		self.rating = json["rating"].floatValue

		// Address
		self.address = json["formatted_address"].stringValue

		// Location
		let geometry = json["geometry"]
		let location = geometry["location"]
		let latitude = location["lat"].doubleValue
		let longitude = location["lng"].doubleValue
		self.location = CLLocation(latitude: latitude, longitude: longitude)
		
		// Opening hours
		let openingHours = json["opening_hours"]
		self.openNow = openingHours["open_now"].boolValue
		for day in openingHours["weekday_text"].arrayValue {
			if !day.stringValue.isEmpty {
				self.period.append(day.stringValue)
			}
		}
		
		// Photos
		self.icon = json["icon"].stringValue
		self.photos = Photo.arrayFromJson(json["photos"])
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
	
	class func arrayFromJson(json: JSON) -> [Place] {
		var places = [Place]()
		for placeJson in json.arrayValue {
			if let place = Place(json: placeJson) {
				places.append(place)
			}
		}
		return places
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
