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
	var distance: Double = 0
	
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
	
	init(json: JSON) {
		// Info
		self.id = json["place_id"].stringValue
		self.name = json["name"].stringValue
		self.rating = json["rating"].floatValue

		// Address
		self.address = json["formatted_address"].stringValue

		// Location
		let geometry = json["geometry"]
		let location = geometry["location"]
		let latitude = location["lat"].doubleValue
		let longitude = location["lng"].doubleValue
		self.location = CLLocation(latitude: latitude, longitude: longitude)
		
		if let userLocation = Location.lastLocation {
			self.distance = userLocation.distanceFromLocation(self.location)
		}
		
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
			places.append(Place(json: placeJson))
		}
		return places
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
