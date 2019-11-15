//
//  NetworkManager.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-15.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation

import Alamofire

class NetworkManager {
    private init() {}
    static let shared = NetworkManager()
    
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

