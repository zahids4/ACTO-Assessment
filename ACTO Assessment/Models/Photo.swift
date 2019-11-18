//
//  Photo.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation
import RealmSwift

public class Photo: Object, Decodable {
    @objc dynamic var id: Int = -1
    @objc dynamic var albumId: Int = -1
    @objc dynamic var title = ""
    @objc dynamic var url = ""
    
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case title
        case id
        case url
    }
}
