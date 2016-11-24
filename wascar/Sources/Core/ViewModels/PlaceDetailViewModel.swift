//
//  PlaceDetailViewModel.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
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
// MARK: - Class - PlaceDetailViewModel
//
//**************************************************************************************************

class PlaceDetailViewModel: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************

	var title = L.details
	var placeId: String
	var name: String
	var address: String
	var openingHours: String
	var openNow: Bool
	var rating: String
	var photoUrl: String

	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init(place: Place) {
		self.placeId	= place.id
		self.name		= place.name
		self.address	= place.address
		self.openNow	= place.openNow
		self.rating		= String(format: "%.1f", place.rating)
		self.photoUrl	= place.photoUrl
		
		var openingHours = ""
		for hour in place.period {
			openingHours += hour
		}
		self.openingHours = openingHours
	}
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func updatePlace(place: Place) {
		var openingHours = ""
		for hour in place.period {
			openingHours += openingHours.isEmpty ? "" : "\n"
			openingHours += hour
		}
		self.openingHours	= openingHours
		self.address		= place.address
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func loadPlaceById(completion: CompletionSuccess) {
		PlaceManager.requestById(self.placeId) { (success, place) in
			if success && place != nil {
				self.updatePlace(place!)
			}
			completion(success: success)
		}
	}
	
	
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
