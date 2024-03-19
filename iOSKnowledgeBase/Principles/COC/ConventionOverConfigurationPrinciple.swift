//
//  ConventionOverConfiguration.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

import SwiftUI

/// Convention over Configuration (CoC) is a design principle that suggests using sensible defaults and conventions to reduce the need for explicit configuration.
/// In Swift development, CoC can be applied in various areas such as naming conventions, project structure, and framework usage.

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
