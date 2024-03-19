//
//  ProgramToInterfacesNotImplementationsPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// The principle "Program to interfaces, not implementations" encourages writing code that depends on interfaces or protocols rather than concrete implementations. This promotes loose coupling and flexibility, as it allows different implementations of an interface to be swapped in without affecting the rest of the codebase.
/// Let's consider an example in Swift where we define a protocol for a storage service and then use this protocol in our application:
///
/// In this example:
/// We define a StorageService protocol that declares methods for saving and loading data.
/// We provide two concrete implementations of the storage service: UserDefaultsStorageService and FileManagerStorageService, each conforming to the StorageService protocol.
/// We use the StorageService protocol as the type for the storageService variable. This allows us to switch between different implementations without modifying the rest of the code.
/// We demonstrate using both implementations of the storage service to save and load user data.
/// By programming to interfaces (protocols) rather than implementations, we ensure that our code is more flexible and easier to maintain,
/// as it's not tightly coupled to specific implementations.
/// We can easily swap implementations or add new ones without affecting the code that uses the StorageService protocol.

import Foundation

// Protocol for a storage service
protocol PTINIStorageService {
    func save(data: Data, to path: String)
    func load(from path: String) -> Data?
}

// Concrete implementation of the storage service using UserDefaults
struct PTINIUserDefaultsStorageService: PTINIStorageService {
    func save(data: Data, to path: String) {
        UserDefaults.standard.set(data, forKey: path)
    }

    func load(from path: String) -> Data? {
        return UserDefaults.standard.data(forKey: path)
    }
}

// Concrete implementation of the storage service using FileManager
struct PTINIFileManagerStorageService: PTINIStorageService {
    func save(data: Data, to path: String) {
        do {
            try data.write(to: URL(fileURLWithPath: path))
        } catch {
            print("Error saving data: \(error)")
        }
    }

    func load(from path: String) -> Data? {
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            print("Error loading data: \(error)")
            return nil
        }
    }
}

// Usage
//let userData = Data("User data".utf8)

// Use UserDefaults storage service
//var storageService: PTINIStorageService = PTINIUserDefaultsStorageService()
//storageService.save(data: userData, to: "user_data")
//if let loadedData = storageService.load(from: "user_data") {
//    let loadedString = String(decoding: loadedData, as: UTF8.self)
//    print("Loaded data: \(loadedString)")
//}

// Use FileManager storage service
//storageService = PTINIFileManagerStorageService()
//let filePath = FileManager.default.temporaryDirectory.appendingPathComponent("user_data.txt").path
//storageService.save(data: userData, to: filePath)
//if let loadedData = storageService.load(from: filePath) {
//    let loadedString = String(decoding: loadedData, as: UTF8.self)
//    print("Loaded data: \(loadedString)")
//}
