//
//  PhotosListViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol PhotosListViewModelProtocol {
    var totalPhotos: Int { get }
    func photo(at index: Int) -> PhotoViewModelProtocol
    func getPhotos(for albumId: Int)
}

class PhotosListViewModel: PhotosListViewModelProtocol {
    private weak var tableViewDelegate: ListViewModelDelegate?
    
    private var allPhotos: [PhotoViewModelProtocol] = []
    
    init(delegate: ListViewModelDelegate) {
        self.tableViewDelegate = delegate
    }
    
    var totalPhotos: Int {
        return allPhotos.count
    }
    
    func photo(at index: Int) -> PhotoViewModelProtocol {
      return allPhotos[index]
    }
    
    func getPhotos(for albumId: Int) {
        allPhotos = RealmManager.shared.allPhotos.filter({ $0.albumId == albumId }).map({ PhotoViewModel($0) })
        tableViewDelegate?.onGetComplete()
    }
}


