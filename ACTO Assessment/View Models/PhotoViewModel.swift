//
//  PhotoViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

enum ImageDownloadState {
  case new, downloaded, failed
}

protocol PhotoViewModelProtocol {
    var url: String { get }
    var title: String { get }
    var albumId: Int { get }
    var image: UIImage { get set }
    var imageDownloadState: ImageDownloadState { get set }
    var shouldDownloadImage: Bool { get }
    func fetchPhoto() -> Data?
}

class PhotoViewModel: PhotoViewModelProtocol {
    private let photo: Photo
    private let imageUrl: String
    public init(_ photo: Photo) {
        self.photo = photo
        self.imageUrl = photo.url
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
    
    var image: UIImage = UIImage()
    
    var imageDownloadState: ImageDownloadState = .new
    
    var shouldDownloadImage: Bool {
        imageDownloadState == .new && NetworkManager.shared.isConnectedToInternet
    }
    
    func fetchPhoto() -> Data? {
        return try? Data(contentsOf: URL(string: imageUrl)!)
     }
}

