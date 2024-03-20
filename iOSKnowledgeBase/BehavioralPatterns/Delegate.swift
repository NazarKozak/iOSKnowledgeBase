//
//  Delegate.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The delegate pattern is commonly used in Swift development, especially in UIKit-based applications like iOS.
/// It allows one object to delegate certain responsibilities or behaviors to another object.
/// This promotes loose coupling between objects and enhances modularity and flexibility in the codebase.
///
/// In this example:
/// We define a CalculatorDelegate protocol with a method calculatorDidFinishCalculation(result:) to notify the delegate when a calculation is performed.
/// The Calculator class has a delegate property of type CalculatorDelegate? to hold a reference to the delegate object.
/// The Calculator class performs arithmetic operations (add and subtract) and notifies the delegate after each operation.
/// We implement a concrete delegate class CalculatorLogger that conforms to CalculatorDelegate and prints the result of each calculation.
/// Finally, we set an instance of CalculatorLogger as the delegate of the Calculator object and perform arithmetic operations. 
/// The CalculatorLogger object receives notifications and logs the results.
/// This example demonstrates how the delegate pattern allows objects to communicate without being tightly coupled.
/// The Calculator class doesn't need to know the specific behavior of its delegate; it only needs to know that the delegate conforms to the CalculatorDelegate protocol. 
/// This promotes flexibility and modularity in the codebase.

import Foundation

// Protocol defining the delegate behavior
protocol CalculatorDelegate: AnyObject {
    func calculatorDidFinishCalculation(result: Int)
}

// Calculator class
class Calculator {
    weak var delegate: CalculatorDelegate? // Weak reference to avoid retain cycles

    func add(_ a: Int, _ b: Int) -> Int {
        let result = a + b
        delegate?.calculatorDidFinishCalculation(result: result) // Notify delegate
        return result
    }

    func subtract(_ a: Int, _ b: Int) -> Int {
        let result = a - b
        delegate?.calculatorDidFinishCalculation(result: result) // Notify delegate
        return result
    }
}

// Concrete implementation of CalculatorDelegate
class CalculatorLogger: CalculatorDelegate {
    func calculatorDidFinishCalculation(result: Int) {
        print("Calculator result: \(result)")
    }
}
