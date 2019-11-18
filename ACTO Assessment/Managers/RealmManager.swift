//
//  RealmManager.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-15.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    private init() {}
    static let shared = RealmManager()
    
    func saveFetchedUsers(_ users: [User], closure: @escaping () -> ()) {
        let realm = try! Realm()
        let listOfUsers = List<User>()
        users.forEach({ listOfUsers.append($0) })
        
        try! realm.write {
            realm.add(listOfUsers, update: .modified)
        }
        
        closure()
    }
    
    func saveFetchedAlbums(_ albums: [Album]) {
        let realm = try! Realm()
        let listOfAlbums = List<Album>()
        albums.forEach({ listOfAlbums.append($0) })
        
        try! realm.write {
            realm.add(listOfAlbums, update: .modified)
        }
    }
    
    func saveFetchedPhotos(_ photos: [Photo]) {
        let realm = try! Realm()
        let listOfPhotos = List<Photo>()
        photos.forEach({ listOfPhotos.append($0) })
        
        try! realm.write {
            realm.add(listOfPhotos, update: .modified)
        }
    }
    
    func deleteAllUsers() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }

    var allUsers: Results<User> {
        let realm = try! Realm()
        return realm.objects(User.self)
    }
    
    var allAlbums: Results<Album> {
        let realm = try! Realm()
        return realm.objects(Album.self)
    }
    
    var allPhotos: Results<Photo> {
        let realm = try! Realm()
        return realm.objects(Photo.self)
    }
}

