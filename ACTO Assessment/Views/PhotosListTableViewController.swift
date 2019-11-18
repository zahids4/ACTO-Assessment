//
//  PhotosListTableViewController.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-18.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class PhotosListTableViewController: UITableViewController {
    private let operations = ImageDownloadOperations()
    
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoTableViewCell
        
        let photo = viewModel.photo(at: indexPath.row)
        cell.configure(with: photo)
        
        if photo.shouldDownloadImage {
            startDownloadOperation(for: photo, at: indexPath)
        }
        
        return cell
    }
    
    private func startDownloadOperation(for story: PhotoViewModelProtocol, at indexPath: IndexPath) {
         guard operations.downloadsInProgress[indexPath] == nil else { return }

         let downloadOperation = DownloadOperation(story)

         downloadOperation.completionBlock = {
             if downloadOperation.isCancelled { return }

             DispatchQueue.main.async {
                 self.operations.downloadsInProgress.removeValue(forKey: indexPath)
                 self.tableView.reloadRows(at: [indexPath], with: .fade)
             }
         }

         operations.downloadsInProgress[indexPath] = downloadOperation
         operations.operationQueue.addOperation(downloadOperation)
     }
}

extension PhotosListTableViewController: ListViewModelDelegate {
    func onGetComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
