//
//  FailFastPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// In SwiftUI, "fail fast" essentially means handling errors or invalid states as soon as they occur, 
/// typically by displaying an appropriate message to the user or taking corrective action immediately.
/// Let's consider an example of a SwiftUI login form where we implement "fail fast" by displaying an error message when the user enters invalid credentials.
///
/// In this example:
/// The LoginView struct is a SwiftUI view representing a login form. It contains text fields for entering the username and password, as well as a login button. When the user taps the login button, the authenticate() method is called, which attempts to authenticate the user using the AuthenticationManager.
/// If authentication fails, an error message is displayed below the login form. This error message is set in the authenticate() method when the authentication manager returns a failure result.
/// By displaying an error message immediately when authentication fails, we adhere to the "fail fast" principle in SwiftUI. This provides immediate feedback to the user, allowing them to correct their input or take appropriate action without delay.

import SwiftUI

class FFAuthenticationManager {
    func login(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Simulated authentication logic
        let isAuthenticated = (username == "user" && password == "password")
        completion(isAuthenticated ? .success(true) : .failure(AuthenticationError.invalidCredentials))
    }
}

enum FFAuthenticationError: Error {
    case invalidCredentials
}

// LoginView.swift - SwiftUI login form

struct FFLoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var errorMessage: String?

    let authenticationManager = FFAuthenticationManager()

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

            // Display error message if authentication fails
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
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

// Preview

#if DEBUG
struct FFLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FFLoginView()
    }
}
#endif
