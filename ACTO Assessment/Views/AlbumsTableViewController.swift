//
//  AlbumsTableViewController.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    private var viewModel: AlbumsListViewModelProtocol!
    var selectedUserId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AlbumsListViewModel(delegate: self)
        viewModel.getAlbums(for: selectedUserId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalAlbums
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        
        let album = viewModel.album(at: indexPath.row)
        cell.textLabel?.text = album.title
        
        return cell
    }
}

extension AlbumsTableViewController: AlbumsListViewModelDelegate {
    func onGetComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
