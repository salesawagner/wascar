//
//  PlaceListViewModelMock.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
@testable import wascar
import CoreLocation

class PlaceListViewModelLocationMock: PlaceListViewModel {
	
	override func loadPlaces(_ completion: @escaping CompletionSuccess) {
		let location = CLLocation(latitude: 37.332331, longitude: -122.031219)
		self.requestPlacesWithLocation(location, completion: completion)
	}
	
	func loadPlacesInvalid(_ completion: @escaping CompletionSuccess) {
		let location = CLLocation()
		self.requestPlacesWithLocation(location, completion: completion)
	}
}
