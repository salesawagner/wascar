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
	var firstTime: Bool = true
	
	// Photo
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var nameValueLabel: UILabel!
	
	// Address
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var addressValueLabel: UILabel!
	
	// Open now
	@IBOutlet weak var openLabel: UILabel!
	@IBOutlet weak var openValueLabel: UILabel!
	@IBOutlet weak var openNowView: OpenNow!
	
	// Rating
	@IBOutlet weak var ratingLabel: UILabel!
	@IBOutlet weak var ratingValueLabel: UILabel!
	
	// Loading
	@IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setValues() {
		// Values
		self.nameValueLabel.text	= self.viewModel.name
		self.addressValueLabel.text = self.viewModel.address
		self.ratingValueLabel.text	= self.viewModel.rating
		self.openValueLabel.text	= self.viewModel.openingHours
		// Open view
		if self.viewModel.openNow {
			self.openNowView.setStatus(.open)
		} else {
			self.openNowView.setStatus(.close)
		}
		// Photo
		self.photoImageView.WCARsetImageWithUrl(self.viewModel.photoUrl)
		// Animation
		if !self.firstTime {
			UIView.animate(withDuration: 0.25, animations: {
				self.view.layoutIfNeeded()
			})
		} else {
			self.firstTime = false
		}
	}
	
	private func loadPlaceById() {
		self.loadingIndicatorView.startAnimating()
		self.viewModel.loadPlaceById { (success) in
			self.loadingIndicatorView.stopAnimating()
			if success {
				self.setValues()
			} else {
				self.showError()
			}
		}
	}
	
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
		self.setValues()
		self.loadPlaceById()
    }
	
	override func setupUI() {
		super.setupUI()
		self.view.backgroundColor	= UIColor.white
		self.title					= self.viewModel.title
		self.addressLabel.text		= L.address
		self.openLabel.text			= L.open
		self.ratingLabel.text		= L.rating
	}
}
