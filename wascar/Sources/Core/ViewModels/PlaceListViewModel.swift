//
//  PlaceListViewModel.swift
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

typealias CompletionSuccess = ((success: Bool) -> Void)

//**************************************************************************************************
//
// MARK: - Class - PlaceListViewModel
//
//**************************************************************************************************

class PlaceListViewModel: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************

	var title = L.repairList
	var placeCellViewModels: [PlaceCellViewModel] = [PlaceCellViewModel]()
	var placeDetailViewModels: [PlaceDetailViewModel] = [PlaceDetailViewModel]()
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func addPlace(place: Place) {
		let cellViewModel	= PlaceCellViewModel(place: place)
		let detailViewModel	= PlaceDetailViewModel(place: place)
		self.placeCellViewModels.append(cellViewModel)
		self.placeDetailViewModels.append(detailViewModel)
	}
	
	private func setupPlaces(places: [Place]?) {
		if let places = places {
			for place in places {
				self.addPlace(place)
			}
		}
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func loadPlaces(completion: CompletionSuccess) {
		
		Location.getLocation(withAccuracy: .Block, frequency: .OneShot, timeout: 50, onSuccess: { (location) in
			PlaceManager.requestList(location, completion: { (success, places) in
				if success {
					self.setupPlaces(places)
					completion(success: true)
				} else {
					completion(success: false)
				}
			})
		}) { (lastValidLocation, error) in
			completion(success: false)
			print(lastValidLocation)
			print(error)
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
