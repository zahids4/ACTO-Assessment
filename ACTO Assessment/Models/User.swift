//
//  User.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation


struct User: Decodable {
    let name: String
    let userName: String
    let email: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case userName = "username"
        case email
    }
    
}
