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

class UsersListViewModel {
    private weak var tableViewDelegate: UsersListViewModelDelegate?
    
    private var allUsers: [UserViewModelProtocol] = []
    
    init(delegate: UsersListViewModelDelegate) {
        self.tableViewDelegate = delegate
    }
    
    func fetchUsers() {
        ApiProvider.shared.fetchUsers() { result in
            switch result {
            case .success(let users):
                self.allUsers = users.map({ UserViewModel($0) })
            case .failure(let error):
                print(error)
            }
        }
    }
}
