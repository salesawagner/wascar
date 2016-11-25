//
//  PlaceListViewModelMock.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
@testable import wascar

class PlaceListViewModelMock: PlaceListViewModel {
	
	override func loadPlaces(completion: CompletionSuccess) {
		let json = PlaceTests.placesJSON
		let places = Place.arrayFromJson(json["results"])
		self.setupPlaces(places)
		completion(success: true)
	}
}