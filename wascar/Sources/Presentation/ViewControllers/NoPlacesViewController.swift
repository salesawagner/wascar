//
//  NoPlacesViewController.swift
//  wascar
//
//  Created by Wagner Sales on 25/11/16.
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

protocol NoPlacesViewControllerDelegate {
	func loadButtonTapped()
}

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

class NoPlacesViewController: WCARViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var delegate: NoPlacesViewControllerDelegate!
	
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
	
	@IBAction func loadButtonTapped(sender: AnyObject) {
		self.delegate.loadButtonTapped()
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
