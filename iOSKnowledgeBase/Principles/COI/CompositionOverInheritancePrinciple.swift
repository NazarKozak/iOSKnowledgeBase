//
//  CompositionOverInheritancePrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Composition over Inheritance: This principle suggests favoring object composition over class inheritance whenever possible.
/// By composing objects with behavior instead of inheriting it from a superclass, you can achieve greater flexibility and avoid some of the pitfalls of inheritance.

/// In this example:
/// We have a protocol VehicleMovement representing the behavior of moving for different vehicles.
/// We implement concrete movement behaviors using classes DrivingMovement and FlyingMovement.
/// The Vehicle class encapsulates the movement behavior using composition. Each vehicle has a reference to an object conforming to VehicleMovement.
/// Concrete vehicle types like Car and Plane initialize their movement behavior using composition by passing appropriate VehicleMovement objects during initialization.
/// Using composition over inheritance provides several advantages:
/// Flexibility: With composition, you can easily change or extend the behavior of a vehicle by swapping out or adding new movement implementations without affecting the vehicle hierarchy.
/// Simplicity: Composition simplifies the design by avoiding complex inheritance hierarchies. Each class has a single responsibility, making the codebase easier to understand and maintain.
/// Reusability: Components encapsulated through composition can be reused in different contexts, promoting code reuse and modularity.
/// In contrast, using inheritance to model these relationships could lead to a rigid class hierarchy, making it harder to accommodate changes or add new features in the future.

// Protocol representing a vehicle's movement behavior
protocol VehicleMovement {
    func move()
}

// Concrete implementation of VehicleMovement for vehicles that can drive
class DrivingMovement: VehicleMovement {
    func move() {
        print("Vehicle is driving")
    }
}

// Concrete implementation of VehicleMovement for vehicles that can fly
class FlyingMovement: VehicleMovement {
    func move() {
        print("Vehicle is flying")
    }
}

// Class representing a vehicle
class COIVehicle {
    let movement: VehicleMovement

    init(movement: VehicleMovement) {
        self.movement = movement
    }

    func move() {
        movement.move()
    }
}

// Concrete vehicle types
class COICar: COIVehicle {
    init() {
        super.init(movement: DrivingMovement())
    }
}

class COIPlane: COIVehicle {
    init() {
        super.init(movement: FlyingMovement())
    }
}
