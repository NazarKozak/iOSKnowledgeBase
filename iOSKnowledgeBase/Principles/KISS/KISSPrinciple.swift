//
//  KISSPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// The KISS principle advocates for simplicity in design and implementation.
/// By removing unnecessary branching and simplifying the logic, we adhere to the KISS principle. The functions are now easier to understand and maintain.

/// Without KISS principle
class WithoutKISSPrinciple {
    func validateUsername(username: String) -> Bool {
        if username.count >= 6 && username.count <= 12 {
            return true
        } else {
            return false
        }
    }

    func validatePassword(password: String) -> Bool {
        if password.count >= 8 && password.rangeOfCharacter(from: .decimalDigits) != nil {
            return true
        } else {
            return false
        }
    }
}

/// With KISS principle
/// In the above code, the logic for validating the username and password is somewhat convoluted. Let's simplify it:
class WithKISSPrinciple {
    func validateUsername(username: String) -> Bool {
        return username.count >= 6 && username.count <= 12
    }

    func validatePassword(password: String) -> Bool {
        return password.count >= 8 && password.rangeOfCharacter(from: .decimalDigits) != nil
    }
}
