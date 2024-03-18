//
//  OOP.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

///In this example:
///
///We define a base class Car with properties representing make, model, and year of a car. It has an initializer to set these properties and a method displayInfo() to print out the car information.
///We create an instance of Car called myCar, set its properties, and call its method.
///We then define a subclass ElectricCar that inherits from Car. It adds an additional property range representing the range of the electric car and overrides the displayInfo() method to include the range.
///We create an instance of ElectricCar called myElectricCar, set its properties including the range, and call its method.
///This demonstrates the concepts of inheritance, overriding methods, and subclassing in Swift, which are core principles of Object-Oriented Programming.

import Foundation

// Define a class representing a Car
class Car {
    // Properties
    var make: String
    var model: String
    var year: Int

    // Initializer
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }

    // Method to display car information
    func displayInfo() {
        print("Car: \(year) \(make) \(model)")
    }
}

// Create an instance of the Car class
let myCar = Car(make: "Toyota", model: "Camry", year: 2022)

// Access properties and call methods
//print("My car is a \(myCar.year) \(myCar.make) \(myCar.model)")
//myCar.displayInfo()

// Subclass of Car representing a ElectricCar
class ElectricCar: Car {
    // Additional property
    var range: Double

    // Additional initializer
    init(make: String, model: String, year: Int, range: Double) {
        self.range = range
        super.init(make: make, model: model, year: year)
    }

    // Overriding method
    override func displayInfo() {
        print("Electric Car: \(year) \(make) \(model), Range: \(range) miles")
    }
}

// Create an instance of ElectricCar
//let myElectricCar = ElectricCar(make: "Tesla", model: "Model S", year: 2023, range: 350)

// Access properties and call methods of ElectricCar
//print("My electric car is a \(myElectricCar.year) \(myElectricCar.make) \(myElectricCar.model) with a range of \(myElectricCar.range) miles")
//myElectricCar.displayInfo()
