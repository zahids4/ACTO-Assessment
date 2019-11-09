//
//  ApiProvider.swift
//  ACTO Assessment
//
//  Created by Saim Zahid on 2019-11-08.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import Foundation
import Alamofire

class ApiProvider {
    private init() {}
    static let shared = ApiProvider()
    private let userListUrl = "https://jsonplaceholder.typicode.com/users/"
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetchUsers(completionHandler: @escaping (Result<[User], Error>) ->()) {
        AF.request(userListUrl).responseDecodable(of: [User].self, decoder: jsonDecoder) { response in
            switch response.result {
                case .success(let allUsers):
                    completionHandler(.success(allUsers))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        }
    }
}
