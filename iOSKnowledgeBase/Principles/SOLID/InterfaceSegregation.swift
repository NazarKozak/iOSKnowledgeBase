//
//  InterfaceSegregation.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Interface Segregation Principle (ISP): A client should not be forced to implement an interface it doesn't use, and interfaces should be specific to the client's needs.
/// In this example, AllInOnePrinter implements separate protocols for printing, scanning, and faxing. If a client only needs printing functionality, it can conform to the Printer protocol without being forced to implement unnecessary methods.

protocol Printer {
    func printDocument()
}

protocol Scanner {
    func scanDocument()
}

protocol Fax {
    func faxDocument()
}

class AllInOnePrinter: Printer, Scanner, Fax {
    func printDocument() {
        // Code to print document
    }

    func scanDocument() {
        // Code to scan document
    }

    func faxDocument() {
        // Code to fax document
    }
}
