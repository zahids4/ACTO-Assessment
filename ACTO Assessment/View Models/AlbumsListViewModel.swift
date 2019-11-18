//
//  AlbumsListViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol ListViewModelDelegate: class {
    func onGetComplete()
}

protocol AlbumsListViewModelProtocol {
    var totalAlbums: Int { get }
    func album(at index: Int) -> AlbumViewModelProtocol
    func getAlbums(for userId: Int)
}

class AlbumsListViewModel: AlbumsListViewModelProtocol {
    private weak var tableViewDelegate: ListViewModelDelegate?
    
    private var allAlbums: [AlbumViewModelProtocol] = []
    
    init(delegate: ListViewModelDelegate) {
        self.tableViewDelegate = delegate
    }
    
    var totalAlbums: Int {
        return allAlbums.count
    }
    
    func album(at index: Int) -> AlbumViewModelProtocol {
      return allAlbums[index]
    }
    
    func getAlbums(for userId: Int) {
        allAlbums = RealmManager.shared.allAlbums.filter({ $0.userId == userId }).map({ AlbumViewModel($0) })
        tableViewDelegate?.onGetComplete()
    }
}

