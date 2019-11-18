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
        // I could also fetch this list in the main nav controller
        // but I want to experiment with how it looked fetching the lists when needed vs
        // loading them all at the start
        let setUsersAndRefresh = {
            self.allUsers = RealmManager.shared.allUsers.map({ UserViewModel($0) })
            self.tableViewDelegate?.onFetchComplete()
        }
        
        guard NetworkManager.shared.isConnectedToInternet else {
            setUsersAndRefresh()
            return
        }
        
        ApiProvider.shared.fetchUsers() { result in
            switch result {
            case .success(let users):
                RealmManager.shared.saveFetchedUsers(users) {
                    setUsersAndRefresh()
                }
            case .failure(let error):
                print(error)
                self.tableViewDelegate?.onFetchFail()
            }
        }
    }
}
