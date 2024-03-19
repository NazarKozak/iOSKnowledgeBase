//
//  ConventionOverConfiguration.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

import SwiftUI

/// Convention over Configuration (CoC) is a design principle that suggests using sensible defaults and conventions to reduce the need for explicit configuration.
/// In Swift development, CoC can be applied in various areas such as naming conventions, project structure, and framework usage.

/// Without CoC: The properties of the User struct and the IBOutlets in the MyViewController class use underscores to separate words in their names (user_id, user_name, user_email, titleLabel, descriptionLabel, submitButton). This naming convention requires developers to explicitly specify the name of each property and outlet, which can be verbose and error-prone.

/// With CoC: The properties of the User struct and the IBOutlets in the MyViewController class use camelCase naming convention (id, name, email, titleLbl, descriptionLbl, submitBtn). By following this convention, developers can rely on the default behavior of Swift and Interface Builder (IB) to automatically generate names for properties and outlets based on their type, which reduces the need for explicit configuration and improves code readability.

/// By adopting CoC in naming conventions, developers can benefit from a consistent and predictable naming scheme, which enhances code clarity, reduces cognitive load, and promotes collaboration among team members. Additionally, it reduces the need for manual configuration, allowing developers to focus on writing code that adheres to established conventions and best practices.

// Convention over Configuration in Naming Conventions
class ConventionOverConfiguration {
    // Without CoC
    struct User {
        let user_id: String
        let user_name: String
        let user_email: String
    }

    struct MyView: View {
        @State private var titleLabel: String = ""
        @State private var descriptionLabel: String = ""

        var body: some View {
            EmptyView()
        }
    }

    // With CoC
    struct CoCUser {
        let id: String
        let name: String
        let email: String
    }

    struct CoCMyView: View {
        @State private var titleLbl: String = ""
        @State private var descriptionLbl: String = ""

        var body: some View {
            EmptyView()
        }
    }
}

// Convention over Configuration in iOS Project Structure

// Project Structure Without CoC

// ├── Controllers
// │   ├── LoginViewController.swift
// │   ├── ProfileViewController.swift
// │   └── SettingsViewController.swift
// ├── Models
// │   ├── User.swift
// │   └── Settings.swift
// ├── Views
// │   ├── LoginView.swift
// │   ├── ProfileView.swift
// │   └── SettingsView.swift
// ├── Networking
// │   ├── APIManager.swift
// │   └── NetworkConstants.swift
// └── Utilities
//     ├── DateHelper.swift
//     ├── ImageHelper.swift
//     └── UserDefaultsHelper.swift

// Project Structure With CoC

// ├── Features
// │   ├── Login
// │   │   ├── LoginViewController.swift
// │   │   └── LoginView.swift
// │   ├── Profile
// │   │   ├── ProfileViewController.swift
// │   │   └── ProfileView.swift
// │   └── Settings
// │       ├── SettingsViewController.swift
// │       └── SettingsView.swift
// ├── Models
// │   ├── User.swift
// │   └── Settings.swift
// ├── Networking
// │   ├── APIManager.swift
// │   └── NetworkConstants.swift
// └── Utilities
//     ├── DateHelper.swift
//     ├── ImageHelper.swift
//     └── UserDefaultsHelper.swift
