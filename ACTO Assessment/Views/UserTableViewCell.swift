//
//  UserTableViewCell.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    func configureCell(with user: UserViewModelProtocol) {
        userNameLabel.text = user.userName
        fullNameLabel.text = user.fullName
    }
}
