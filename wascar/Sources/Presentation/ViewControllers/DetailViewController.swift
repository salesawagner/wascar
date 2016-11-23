//
//  DetailViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

class DetailViewController: WCARViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var place: Place!
	
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
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func setupNavigation() {
		super.setupNavigation()
		self.title = L.details
	}
	
	override func setupUI() {
		super.setupUI()
		self.view.backgroundColor = UIColor.whiteColor()
	}

}
