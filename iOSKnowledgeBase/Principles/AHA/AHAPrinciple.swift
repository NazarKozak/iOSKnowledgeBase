//
//  AHAPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// The AHA programming principle, standing for "Avoid Hasty Abstractions," advises against premature abstraction of code before its commonalities become clear. This principle encourages developers to wait until they have a clear understanding of the problem domain before introducing abstractions.
///
/// Let's consider a simple example in Swift to illustrate the AHA principle:
/// Suppose we're tasked with implementing a function that calculates the area of various shapes, such as squares, rectangles, and circles. We might initially be tempted to create a generic calculateArea function that accepts any shape type. However, following the AHA principle, we'll start with specific implementations for each shape and look for commonalities later.
///
/// In this example:
/// We have three concrete implementations (Square, Rectangle, and Circle), each conforming to the Shape protocol.
/// Each shape calculates its area independently using its own specific formula.
/// We resist the temptation to create a generic calculateArea function at this stage because the commonalities between shapes are not yet clear.
/// By following the AHA principle, we avoid premature abstraction and keep our code focused on concrete implementations until we have a better understanding of the problem domain. Once we identify commonalities or patterns among shapes, we can refactor our code to introduce abstractions or generic solutions where appropriate. This approach leads to more maintainable and flexible code in the long run.

import Foundation

// Shape protocols
protocol AHAShape {
    func area() -> Double
}

// Square implementation
struct AHASquare: AHAShape {
    let sideLength: Double

    func area() -> Double {
        return sideLength * sideLength
    }
}

// Rectangle implementation
struct AHARectangle: AHAShape {
    let width: Double
    let height: Double

    func area() -> Double {
        return width * height
    }
}

// Circle implementation
struct AHACircle: AHAShape {
    let radius: Double

    func area() -> Double {
        return Double.pi * radius * radius
    }
}

// Usage
//let square = AHASquare(sideLength: 5)
//let rectangle = AHARectangle(width: 4, height: 6)
//let circle = AHACircle(radius: 3)
//print("Area of square: \(square.area())")
//print("Area of rectangle: \(rectangle.area())")
//print("Area of circle: \(circle.area())")
