//
//  UsersTableViewController.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    private var viewModel: UsersListViewModelProtocol!
    var selectedUserId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UsersListViewModel(delegate: self)
        viewModel.fetchUsers()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalUsers
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            let user = self.viewModel.user(at: indexPath.row)
            self.selectedUserId = user.id
            self.performSegue(withIdentifier: "showAlbumsSegue", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell

        let user = viewModel.user(at: indexPath.row)
        cell.configureCell(with: user)

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbumsSegue" {
            let vc = segue.destination as! AlbumsTableViewController
            vc.selectedUserId = selectedUserId
        }
    }
    
}

extension UsersTableViewController: UsersListViewModelDelegate {
    func onFetchComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchFail() {
        print("Fetch Failed")
    }
}
