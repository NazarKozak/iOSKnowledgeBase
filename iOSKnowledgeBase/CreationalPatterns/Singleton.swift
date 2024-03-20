//
//  Singleton.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Singleton Pattern ensures that a class has only one instance and provides a global point of access to that instance. It's commonly used in scenarios where you need exactly one instance of a class to manage a shared resource or maintain a central state throughout your application.
/// Here's a brief description of how the Singleton Pattern works:
/// Private Constructor: The class with the Singleton instance typically has a private constructor to prevent external instantiation of the class.
/// Static Instance: The class provides a static method or property to access the single instance of the class.
/// Lazy Initialization: The Singleton instance is lazily initialized the first time it's accessed to defer its creation until it's needed.
/// Global Access: The Singleton instance is globally accessible throughout the application, allowing any part of the codebase to access it.
///
/// In this example:
/// We define a Singleton class with a private initializer to prevent external instantiation.
/// We provide a static property shared that holds the single instance of the Singleton class.
/// Clients access the Singleton instance using Singleton.shared.
/// The Singleton instance is lazily initialized the first time it's accessed.
/// Changes made to the Singleton instance are visible across all parts of the application that access it.
/// It's important to use Singletons judiciously, as they can introduce tight coupling and make testing more difficult due to their global state.
/// However, when used appropriately, Singletons can be a powerful tool for managing shared resources and maintaining global state in your application.

import Foundation

class Singleton {
    // Static property to hold the single instance of the class
    static let shared = Singleton()

    // Private initializer to prevent external instantiation
    private init() {}

    // Properties and methods of the Singleton class
    var data: String = "Initial data"

    func doSomething() {
        print("Singleton is doing something with data: \(data)")
    }
}
