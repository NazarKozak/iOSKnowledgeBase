//
//  AbstractFactory.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Abstract Factory Pattern is a creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes. It allows you to create objects without specifying their concrete types, providing a way to encapsulate a group of individual factories that have a common theme.

/// Here's a brief description of how the Abstract Factory Pattern works:
/// Abstract Factory: Declares an interface for creating a family of related objects, such as products in a product line.
/// Concrete Factory: Implements the Abstract Factory interface to create concrete product objects.
/// Abstract Product: Declares an interface for a type of product object.
/// Concrete Product: Implements the Abstract Product interface to define specific types of product objects.
///
/// In this example:
/// Animal and Food are abstract product protocols representing types of animals and food, respectively.
/// Dog, Cat, Bones, and Fish are concrete product classes implementing the abstract product protocols.
/// AnimalFactory is the abstract factory protocol declaring methods for creating animals and food.
/// DogFactory and CatFactory are concrete factory classes implementing the abstract factory protocol to create Dog and Cat instances along with their associated Food instances.
/// Clients use the concrete factory classes to create families of related objects without needing to know the specific implementation details of the products. This promotes loose coupling and flexibility in object creation.

import Foundation

// Abstract product protocols
protocol AFAnimal {
    func makeSound()
}

protocol AFFood {
    func feed()
}

// Concrete product classes
class AFDog: AFAnimal {
    func makeSound() {
        print("Woof!")
    }
}

class AFCat: AFAnimal {
    func makeSound() {
        print("Meow!")
    }
}

class AFBones: AFFood {
    func feed() {
        print("Give bones to the animal")
    }
}

class AFFish: AFFood {
    func feed() {
        print("Give fish to the animal")
    }
}

// Abstract factory protocol
protocol AFAnimalFactory {
    func createAnimal() -> AFAnimal
    func createFood() -> AFFood
}

// Concrete factory classes
class AFDogFactory: AFAnimalFactory {
    func createAnimal() -> AFAnimal {
        return AFDog()
    }

    func createFood() -> AFFood {
        return AFBones()
    }
}

class AFCatFactory: AFAnimalFactory {
    func createAnimal() -> AFAnimal {
        return AFCat()
    }

    func createFood() -> AFFood {
        return AFFish()
    }
}

// Usage
//let dogFactory = AFDogFactory()
//let dog = dogFactory.createAnimal()
//let dogFood = dogFactory.createFood()
//
//dog.makeSound() // Output: Woof!
//dogFood.feed() // Output: Give bones to the animal
//
//let catFactory = AFCatFactory()
//let cat = catFactory.createAnimal()
//let catFood = catFactory.createFood()
//
//cat.makeSound() // Output: Meow!
//catFood.feed() // Output: Give fish to the animal
