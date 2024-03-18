//
//  DependencyInversionPrinciple.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Dependency Inversion Principle (DIP): High-level modules should not depend on low-level modules, but both should depend on abstractions. Abstractions should not depend on details; details should depend on abstractions.
/// In this example, PaymentProcessor depends on the PaymentGateway protocol rather than specific implementations like StripePaymentGateway or PayPalPaymentGateway. This allows for easy swapping of payment gateways without modifying the PaymentProcessor class.

protocol PaymentGateway {
    func processPayment(amount: Double)
}

class StripePaymentGateway: PaymentGateway {
    func processPayment(amount: Double) {
        // Code to process payment via Stripe
    }
}

class PayPalPaymentGateway: PaymentGateway {
    func processPayment(amount: Double) {
        // Code to process payment via PayPal
    }
}

class PaymentProcessor {
    let paymentGateway: PaymentGateway

    init(paymentGateway: PaymentGateway) {
        self.paymentGateway = paymentGateway
    }

    func purchaseItem(amount: Double) {
        paymentGateway.processPayment(amount: amount)
    }
}
