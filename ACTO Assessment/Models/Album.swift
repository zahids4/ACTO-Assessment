//
//  Album.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation
import RealmSwift

public class Album: Object, Decodable {
    @objc dynamic var id: Int = -1
    @objc dynamic var userId: Int = -1
    @objc dynamic var title = ""
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case title
        case id
    }
}
