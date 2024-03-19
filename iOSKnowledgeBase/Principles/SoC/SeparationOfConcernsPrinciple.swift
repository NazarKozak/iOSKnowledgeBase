//
//  SeparationOfConcernsPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// Separation of Concerns (SoC) is a design principle that advocates breaking a system into distinct features or components, 
/// each responsible for a single aspect of functionality.
/// Let's consider an example in the context of a simple iOS application for managing user authentication,
/// where we'll separate concerns related to authentication logic, user interface, and data storage.
///
/// In this example:
/// AuthenticationManager remains responsible for the authentication logic, similar to the previous example.
/// LoginView is a SwiftUI view responsible for rendering the user interface. It uses @State to manage the state of username, password, and error message. When the login button is tapped, it invokes the authenticate() method, which calls the login() method on AuthenticationManager. Upon completion of the authentication process, it updates the error message state if authentication fails.
/// This separation of concerns allows for a clear distinction between the logic for authentication and the logic for presenting the user interface. Each component focuses on its specific responsibility, making the code easier to understand, maintain, and test.

import SwiftUI

class AuthenticationManager {
    func login(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Simulated authentication logic
        let isAuthenticated = (username == "user" && password == "password")
        completion(isAuthenticated ? .success(true) : .failure(AuthenticationError.invalidCredentials))
    }
}

enum AuthenticationError: Error {
    case invalidCredentials
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String? {
        didSet {
            showError = errorMessage != nil
        }
    }

    let authenticationManager = AuthenticationManager()

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Login") {
                authenticate()
            }
            .padding()
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text(errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
        .padding()
    }

    private func authenticate() {
        authenticationManager.login(username: username, password: password) { result in
            switch result {
            case .success:
                // Code to handle successful authentication
                print("Authentication succeeded!")
            case .failure(let error):
                // Code to handle authentication failure
                errorMessage = error.localizedDescription
            }
        }
    }
}
