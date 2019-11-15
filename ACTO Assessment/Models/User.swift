//
//  User.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation
import RealmSwift

public class User: Object, Decodable {
    @objc dynamic var id: Int = -1
    @objc dynamic var name = ""
    @objc dynamic var userName = ""
    @objc dynamic var email = ""
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case userName = "username"
        case email
        case id
    }    
}
