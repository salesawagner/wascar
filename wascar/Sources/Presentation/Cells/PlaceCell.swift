//
//  PlaceCell.swift
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

let kPlaceCellIdentifier = "PlaceCellIdentifier"

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class - PlaceCell
//
//**************************************************************************************************

class PlaceCell: UITableViewCell {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setupPhotoImage() {
		self.photoImageView.layer.cornerRadius	= self.photoImageView.frame.size.width/2
		self.photoImageView.layer.masksToBounds = self.photoImageView.layer.cornerRadius > 0
	}
	
	private func resetData() {
		self.photoImageView.image = nil
		self.distanceLabel.text = ""
		self.nameLabel.text = ""
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func setup(viewModel: PlaceCellViewModel) {
		self.photoImageView.setImageWithUrl(viewModel.photoUrl)
		self.nameLabel.text = viewModel.name
		self.distanceLabel.text = viewModel.distance
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func awakeFromNib() {
        super.awakeFromNib()
		self.resetData()
		self.setupPhotoImage()
    }
	
	override func prepareForReuse() {
		self.resetData()
	}
}
