//
//  PhotosListTableViewController.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PhotosListTableViewController: UITableViewController {
    private var viewModel: PhotosListViewModelProtocol!
    var selectedAlbumId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PhotosListViewModel(delegate: self)
        viewModel.getPhotos(for: selectedAlbumId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalPhotos
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)
        
        let photo = viewModel.photo(at: indexPath.row)
        cell.textLabel?.text = photo.title
        
        return cell
    }
}

extension PhotosListTableViewController: ListViewModelDelegate {
    func onGetComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
