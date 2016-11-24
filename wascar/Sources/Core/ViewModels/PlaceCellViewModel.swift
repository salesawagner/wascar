//
//  PlaceCellViewModel.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import SwiftLocation

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
// MARK: - Class - PlaceCellViewModel
//
//**************************************************************************************************

class PlaceCellViewModel: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var photoUrl: String
	var name: String
	var distance: String = ""
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init(place: Place) {
		self.photoUrl	= place.photoUrl
		self.name		= place.name
		
		if let userLocation = Location.lastLocation {
			let placeLocation = place.location
			let distance = userLocation.distanceFromLocation(placeLocation)
			self.distance = distance.WCARmetersToString()
		}
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
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
