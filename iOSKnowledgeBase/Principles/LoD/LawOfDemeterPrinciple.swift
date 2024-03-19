//
//  LawOfDemeterPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// The Law of Demeter, also known as the principle of least knowledge, suggests that a module should have limited knowledge about the internals of other modules. 
/// In SwiftUI, this principle can be applied by minimizing the chain of property accesses and method calls within a view hierarchy.
/// Let's consider an example of a SwiftUI view that displays information about a user and adheres to the Law of Demeter:

import SwiftUI

// User model
struct LoDUser {
    let name: String
    let age: Int
    let email: String
}

// View displaying user information
struct LoDUserProfileView: View {
    let user: LoDUser

    var body: some View {
        VStack {
            Text("User Profile")
                .font(.title)

            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
            Text("Email: \(user.email)")
        }
        .padding()
    }
}

/// In this example:
/// We have a User struct representing user information, including name, age, and email.
/// The UserProfileView is a SwiftUI view responsible for displaying user information. It receives a User object as input and renders the user's name, age, and email using Text views.
/// This example adheres to the Law of Demeter because the UserProfileView doesn't directly access properties or methods of the User object beyond what's necessary to render the view. It only accesses the properties name, age, and email of the User object, which are directly relevant to displaying the user profile. There are no unnecessary property accesses or method calls that would violate the Law of Demeter.
/// By following the Law of Demeter in SwiftUI views, you can create more modular and maintainable code that is easier to understand and reason about. Each view remains focused on its specific responsibility without having intimate knowledge of the internal structure of the model objects it interacts with.
