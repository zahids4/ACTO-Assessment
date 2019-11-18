//
//  AlbumViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation


protocol AlbumViewModelProtocol {
    var userId: Int { get }
    var id: Int { get }
    var title: String { get }
}

class AlbumViewModel: AlbumViewModelProtocol {
    private let album: Album
    
    public init(_ album: Album) {
        self.album = album
    }
    
    var id: Int {
        return album.id
    }
    
    var userId: Int {
        return album.userId
    }
    
    var title: String {
        return album.title
    }
}
