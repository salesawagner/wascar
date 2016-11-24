//
//  PlaceDetailViewController.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
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

//**************************************************************************************************
//
// MARK: - Class - PlaceDetailViewController
//
//**************************************************************************************************

class PlaceDetailViewController: WCARViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var viewModel: PlaceDetailViewModel!
	
	// Photo
	@IBOutlet weak var photoImageView: UIImageView!
	
	// Address
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var addressValueLabel: UILabel!
	
	// Open now
	@IBOutlet weak var openLabel: UILabel!
	@IBOutlet weak var openNowView: OpenNow!
	
	// Rating
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var ratingValueLabel: UILabel!
	
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
		self.setupUI()
    }
	
	override func setupNavigation() {
		super.setupNavigation()
		self.title = self.viewModel.title
	}
	
	override func setupUI() {
		super.setupUI()
		self.view.backgroundColor = UIColor.whiteColor()
		self.addressLabel.text = L.address
		self.openLabel.text = L.open
		self.ratingLabel.text = L.rating
		
		// Values
		self.addressValueLabel.text = self.viewModel.address
		self.ratingValueLabel.text = self.viewModel.rating
		if self.viewModel.openNow {
			self.openNowView.setStatus(.Open)
		} else {
			self.openNowView.setStatus(.Close)
		}
		self.photoImageView.setImageWithUrl(self.viewModel.photoUrl)
	}

}