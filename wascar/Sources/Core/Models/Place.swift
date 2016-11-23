//
//  Place.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

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
	
	var id: String { // place_id
		return "ChIJLyNIwpJmZIgRKrlDg5TZti0"
	}
	
	var name: String { // name
		return "Import Auto Maintenance"
	}
	
	var address: String { //formatted_address
		return "1616 Broadway, Nashville, TN 37203, United States"
	}
	
	var latitude: Double { // "geometry":{"location":{"lat":
		return 36.153749
	}
	
	var longitude: Double { // "geometry":{"location":{"lng":
		return -86.79380049999999
	}
	
	var imageUrl: String { //icon
		return "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png"
	}
	
	var rating: CGFloat { //rating
		return 4.2
	}
	
	var openNow: Bool { //open_now
		return true
	}
	
	/*
	"opening_hours": {
		"periods": [
			{
				"close": {
					"day": 1,
					"time": "1800"
				},
				"open": {
					"day": 1,
					"time": "0800"
				}
			}
		]
	}
	*/
	var period: [String] {
		var period = [String]()
		period.append("Monday, 08:00-1800")
		period.append("Monday, 08:00-1800")
		period.append("Monday, 08:00-1800")
		period.append("Monday, 08:00-1800")
		period.append("Monday, 08:00-1800")
		period.append("Monday, closed")
		period.append("Monday, close")
		return period
	}
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
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
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
