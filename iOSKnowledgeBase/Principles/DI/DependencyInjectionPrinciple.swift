//
//  DependencyInjectionPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

import Foundation

// Protocol defining the networking behavior
protocol NetworkService {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void)
}

// Concrete implementation of NetworkService
class APIService: NetworkService {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        // Code to fetch data from a remote server
        // For demonstration, we'll just use a dummy data
        let dummyData = "User data from server".data(using: .utf8)!
        completion(.success(dummyData))
    }
}

// UserService class depends on NetworkService protocol
class UserService {
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchUserData(completion: @escaping (Result<String, Error>) -> Void) {
        networkService.fetchData { result in
            switch result {
            case .success(let data):
                if let userData = String(data: data, encoding: .utf8) {
                    completion(.success(userData))
                } else {
                    completion(.failure(NSError(domain: "UserService", 
                                                code: 1,
                                                userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

class UserServiceUseCase {
    // Dependency injection at the time of creating UserService instance
    let apiService: APIService
    let userService: UserService

    init(userService: UserService) {
        self.apiService = APIService()
        self.userService = UserService(networkService: apiService)

        // Usage of UserService to fetch user data
        userService.fetchUserData { result in
            switch result {
            case .success(let userData):
                print("User data fetched: \(userData)")
            case .failure(let error):
                print("Error fetching user data: \(error)")
            }
        }
    }
}
