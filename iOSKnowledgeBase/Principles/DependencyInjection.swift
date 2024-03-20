//
//  DependencyInjection.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

import Foundation

/// Dependency Injection (DI) is a design pattern in which the dependencies of a component are provided from the outside rather than being created internally. This promotes loose coupling between components and facilitates testing, reuse, and maintainability

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

/// In this example:

/// We define a NetworkService protocol to represent the behavior of fetching data from a remote server.
/// APIService is a concrete implementation of NetworkService responsible for fetching data from a server.
/// UserService depends on NetworkService protocol for fetching user data. It's initialized with an instance conforming to NetworkService.
/// During initialization of UserService, we inject the dependency of APIService through its initializer.
/// Finally, we create an instance of APIService and use it to create an instance of UserService. This instance is then used to fetch user data.
/// This way, UserService is decoupled from the specific implementation of networking, making it easier to replace or mock the networking component during testing or when requirements change. Dependency injection promotes flexibility and testability in our codebase.
