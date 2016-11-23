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
		self.photoImageView.layer.masksToBounds = self.photoImageView.layer.cornerRadius > 0
		self.photoImageView.backgroundColor		= UIColor.greenColor()
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
	
	func setup(cellVM: ListTableViewCellVM) {
		Alamofire.request(.GET, cellVM.photoUrl).responseImage { response in
			if let image = response.result.value {
				self.photoImageView.image = image
			}
		}
		self.nameLabel.text = cellVM.name
		self.distanceLabel.text = cellVM.distance
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
