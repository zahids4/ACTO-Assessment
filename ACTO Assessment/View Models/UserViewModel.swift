//
//  UserViewModel.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

protocol UserViewModelProtocol {
    var name: String { get }
}

class UserViewModel: UserViewModelProtocol {
    private let user: User
    
    public init(_ user: User) {
        self.user = user
    }
    
    var name: String {
        return user.name
    }
}
