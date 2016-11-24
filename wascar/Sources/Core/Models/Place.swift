//
//  Place.swift
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
	var latitude: Double
	var longitude: Double
	
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
		if self.address.isEmpty {
			self.address = json["vicinity"].stringValue
		}

		// Location
		let geometry = json["geometry"]
		let location = geometry["location"]
		self.latitude = location["lat"].doubleValue
		self.longitude = location["lng"].doubleValue
		
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
