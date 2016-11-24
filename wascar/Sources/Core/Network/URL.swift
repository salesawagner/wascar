//
//  URL.swift
//  wascar
//
//  Created by Wagner Sales on 24/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

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
// MARK: - Class - URL
//
//**************************************************************************************************

class URL {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	static var apiKey: String {
		return "AIzaSyBQdUB4ud-KqBpEVuq7gfLuc9c_f0q1RKY"
	}
	
	static var placeApiUrl: String {
		return "https://maps.googleapis.com/maps/api/place"
	}
	
	static var photoBaseUrl: String {
		return "\(self.placeApiUrl)/photo"
	}
	
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
	
	class func baseUrl(type: String) -> String {
		return "\(self.placeApiUrl)/\(type)/json"
	}
	
	class func places(type: String) -> String {
		return "\(self.baseUrl("textsearch"))?types=\(type)&key=\(self.apiKey)"
	}
	
	class func placeById(id: String) -> String {
		return "\(self.baseUrl("details"))?placeid=\(id)&key=\(self.apiKey)"
	}
	
	class func photo(reference: String, maxWidth: Int = 400) -> String {
		return "\(photoBaseUrl)?maxwidth=\(maxWidth)&photoreference=\(reference)&key=\(self.apiKey)"
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}

