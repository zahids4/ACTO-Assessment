//
//  UserViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol UserViewModelProtocol {
    var fullName: String { get }
    var userName: String { get }
    var id: Int { get }
}

class UserViewModel: UserViewModelProtocol {
    private let user: User
    
    public init(_ user: User) {
        self.user = user
    }
    
    var fullName: String {
        return user.name
    }
    
    var userName: String {
        return user.userName
    }
    
    var id: Int {
        return user.id
    }
}
