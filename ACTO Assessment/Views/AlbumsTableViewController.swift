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
    var selectedAlbumId: Int!

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            let album = self.viewModel.album(at: indexPath.row)
            self.selectedAlbumId = album.id
            self.performSegue(withIdentifier: "showPhotosSegue", sender: self)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        
        let album = viewModel.album(at: indexPath.row)
        cell.textLabel?.text = album.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotosSegue" {
            let vc = segue.destination as! PhotosListTableViewController
            vc.selectedAlbumId = selectedAlbumId
        }
    }
}

extension AlbumsTableViewController: ListViewModelDelegate {
    func onGetComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
