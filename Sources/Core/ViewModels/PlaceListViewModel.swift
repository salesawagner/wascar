//
//  PlaceListViewModel.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
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
	
	private func addPlace(_ place: Place) {
		let cellViewModel	= PlaceCellViewModel(place: place)
		let detailViewModel	= PlaceDetailViewModel(place: place)
		self.placeCellViewModels.append(cellViewModel)
		self.placeDetailViewModels.append(detailViewModel)
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func requestPlacesWithLocation(_ location: CLLocation, completion: @escaping CompletionSuccess) {
		let _ = PlaceManager.requestList(location, completion: { (success, places) in
			if success {
				self.setupPlaces(places)
				completion(true)
			} else {
				completion(false)
			}
		})
	}
	
	internal func setupPlaces(_ places: [Place]?) {
		if let places = places {
			let placesSorted = places.sorted(by: {
				$0.distance < $1.distance
			})
			for place in placesSorted {
				self.addPlace(place)
			}
		}
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func loadPlaces(_ completion: @escaping CompletionSuccess) {
		let _ = Location.getLocation(withAccuracy: .block, frequency: .oneShot, timeout: 5, onSuccess: { (location) in
			self.requestPlacesWithLocation(location, completion: completion)
		}) { (lastValidLocation, error) in
			completion(false)
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
