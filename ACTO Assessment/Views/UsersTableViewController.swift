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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell

        let user = viewModel.user(at: indexPath.row)
        cell.configureCell(with: user)

        return cell
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
