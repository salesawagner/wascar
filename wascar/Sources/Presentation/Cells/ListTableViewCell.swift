//
//  ListTableViewCell.swift
//  wascar
//
//  Created by Wagner Sales on 23/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

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

let kListCellIdentifier = "ListCellIdentifier"

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

class ListTableViewCellVM: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var photoUrl: String {
		return ""
	}
	
	var name: String {
		return "Name"
	}
	
	var distance: String {
		return "distance"
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
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
}

class ListTableViewCell: UITableViewCell {

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
		self.photoImageView.backgroundColor		= UIColor.greenColor()
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	private func setup(cellVM: ListTableViewCellVM) {
		Alamofire.request(.GET, cellVM.photoUrl).responseImage { response in
			if let image = response.result.value {
				self.photoImageView.image = image
			}
			self.stop()
		}
		self.nameLabel.text = cellVM.name
		self.distanceLabel.text = cellVM.distance
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func awakeFromNib() {
        super.awakeFromNib()
		self.setupPhotoImage()
    }
	
	override func prepareForReuse() {
		self.photoImageView.image = nil
		self.distanceLabel.text = ""
		self.nameLabel.text = ""
	}
}
