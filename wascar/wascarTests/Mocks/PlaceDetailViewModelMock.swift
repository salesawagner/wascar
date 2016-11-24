//
//  PlaceDetailViewModelMock.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
@testable import wascar

class PlaceDetailViewModelMock: PlaceDetailViewModel {
	
	override func loadPlaceById(completion: CompletionSuccess) {
		let json = PlaceTests.placeDetailJSON
		let place = Place(json: json["result"])
		self.updatePlace(place)
		completion(success: true)
	}
}