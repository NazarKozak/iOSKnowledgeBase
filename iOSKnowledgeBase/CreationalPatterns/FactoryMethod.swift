//
//  FactoryMethodPattern.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Factory Method Pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. It promotes loose coupling by decoupling the client code from the concrete classes being instantiated.

/// Here's a brief description of how the Factory Method Pattern works:
/// Creator Class: Defines an abstract or concrete class with a method (the factory method) for creating objects. The creator class may also provide default implementation for other methods that use the factory method to create objects.
/// Concrete Creator: Subclasses the creator class and implements the factory method to create specific instances of objects.
/// Product Class: Represents the type of object being created. This can be an abstract class or interface implemented by concrete product classes.
/// Concrete Product: Implements the product interface and represents the actual objects being created by the factory method.

import Foundation

// Product protocol
protocol FMAnimal {
    func makeSound()
}

// Concrete products
class FMDog: FMAnimal {
    func makeSound() {
        print("Woof!")
    }
}

class FMCat: FMAnimal {
    func makeSound() {
        print("Meow!")
    }
}

// Creator class with factory method
class FMAnimalFactory {
    func createAnimal() -> FMAnimal {
        fatalError("Subclasses must implement createAnimal method")
    }

    // Other methods that use the factory method to create objects
    func interactWithAnimal() {
        let animal = createAnimal()
        animal.makeSound()
    }
}

// Concrete creator classes
class FMDogFactory: FMAnimalFactory {
    override func createAnimal() -> FMAnimal {
        return FMDog()
    }
}

class FMCatFactory: FMAnimalFactory {
    override func createAnimal() -> FMAnimal {
        return FMCat()
    }
}

//Usage
//let dogFactory = DogFactory()
//dogFactory.interactWithAnimal() // Output: Woof!
//
//let catFactory = CatFactory()
//catFactory.interactWithAnimal() // Output: Meow!
