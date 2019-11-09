//
//  UsersListViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol UsersListViewModelDelegate: class {
    func onFetchComplete()
    func onFetchFail()
}

protocol UsersListViewModelProtocol {
    var totalUsers: Int { get }
    func user(at index: Int) -> UserViewModelProtocol
    func fetchUsers()
}

class UsersListViewModel: UsersListViewModelProtocol {
    private weak var tableViewDelegate: UsersListViewModelDelegate?
    
    private var allUsers: [UserViewModelProtocol] = []
    
    init(delegate: UsersListViewModelDelegate) {
        self.tableViewDelegate = delegate
    }
    
    var totalUsers: Int {
        return allUsers.count
    }
    
    func user(at index: Int) -> UserViewModelProtocol {
      return allUsers[index]
    }
    
    func fetchUsers() {
        ApiProvider.shared.fetchUsers() { result in
            switch result {
            case .success(let users):
                self.allUsers = users.map({ UserViewModel($0) })
                self.tableViewDelegate?.onFetchComplete()
            case .failure(let error):
                print(error)
                self.tableViewDelegate?.onFetchFail()
            }
        }
    }
}
