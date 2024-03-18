//
//  LiskovSubstitutionPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Liskov Substitution Principle (LSP): Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program.
/// In this example, both Duck and Penguin are subclasses of Bird, and they override the fly() method appropriately. Although penguins cannot fly, they still conform to the Bird superclass without breaking the program.

class Bird {
    func fly() {
        // Code to fly
    }
}

class Duck: Bird {
    override func fly() {
        // Ducks can fly, so no changes here
    }
}

class Penguin: Bird {
    override func fly() {
        // Penguins cannot fly, so override with empty method
    }
}
