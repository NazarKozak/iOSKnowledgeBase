//
//  OpenClosedPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Open/Closed Principle (OCP): Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.
/// In this example, the AreaCalculator class is open for extension, as you can add new shapes implementing the Shape protocol without modifying the AreaCalculator class itself.

protocol Shape {
    func area() -> Double
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Square: Shape {
    let sideLength: Double

    init(sideLength: Double) {
        self.sideLength = sideLength
    }

    func area() -> Double {
        return sideLength * sideLength
    }
}

class AreaCalculator {
    func calculateArea(of shape: Shape) -> Double {
        return shape.area()
    }
}
