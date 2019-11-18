//
//  PhotoTableViewCell.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with photo: PhotoViewModelProtocol) {
        titleLabel.text = photo.title
        photoImageView.image = photo.image
    }
}
