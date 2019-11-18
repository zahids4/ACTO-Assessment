//
//  NavigationViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

class NavigationViewModel {
    func fetchAlbums() {
        ApiProvider.shared.fetchAlbums() { result in
            switch result {
            case .success(let albums):
                RealmManager.shared.saveFetchedAlbums(albums)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPhotos() {
        ApiProvider.shared.fetchPhotos() { result in
            switch result {
            case .success(let photos):
                RealmManager.shared.saveFetchedPhotos(photos)
            case .failure(let error):
                print(error)
            }
        }
    }
}
