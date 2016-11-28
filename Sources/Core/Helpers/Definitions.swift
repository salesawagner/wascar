//
//  Definitions.swift
//  wascar
//
//  Created by Wagner Sales on 28/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

// Handler
typealias Completion = () -> Void
typealias CompletionSuccess = (_ success: Bool) -> Void
typealias CompletionSuccessPlaces = (_ success: Bool, _ places: [Place]?) -> Void
typealias CompletionSuccessPlace = (_ success: Bool, _ place: Place?) -> Void
