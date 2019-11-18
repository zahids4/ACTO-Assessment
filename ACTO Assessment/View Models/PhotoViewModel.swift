//
//  PhotoViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol PhotoViewModelProtocol {
    var url: String { get }
    var title: String { get }
    var albumId: Int { get }
}

class PhotoViewModel: PhotoViewModelProtocol {
    private let photo: Photo
    
    public init(_ photo: Photo) {
        self.photo = photo
    }
    
    var url: String {
        return photo.url
    }
    
    var albumId: Int {
        return photo.albumId
    }
    
    var title: String {
        return photo.title
    }
}

