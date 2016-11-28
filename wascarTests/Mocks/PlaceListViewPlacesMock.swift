//
//  PlaceListViewModelMock.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
@testable import wascar
import SwiftyJSON
import CoreLocation

class PlaceListViewModelPlacesMock: PlaceListViewModel {
	
	var placesJSON: JSON {
		let bundle = Bundle(for: WCARTest.self)
		let filePath = bundle.path(forResource: "places", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
		return JSON(data: data!)
	}
	
	override func requestPlacesWithLocation(_ location: CLLocation? = nil, completion: @escaping CompletionSuccess) {
		self.setupPlaces(Place.arrayFromJson(self.placesJSON["results"]))
		completion(true)
	}
	
	override func loadPlaces(_ completion: @escaping CompletionSuccess) {
		self.requestPlacesWithLocation(completion: completion)
	}

}
