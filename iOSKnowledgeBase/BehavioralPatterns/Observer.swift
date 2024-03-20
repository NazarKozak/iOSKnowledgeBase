//
//  Observer.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Observer is a behavioral design pattern that allows some objects to notify other objects about changes in their state.
/// The Observer pattern provides a way to subscribe and unsubscribe to and from these events for any object that implements a subscriber interface.
/// Usage examples: The Observer pattern is pretty common in Swift code, especially in the GUI components. It provides a way to react to events happening in other objects without coupling to their classes.
/// Identification: The pattern can be recognized by subscription methods, that store objects in a list and by calls to the update method issued to objects in that list.

import UIKit

class ObserverRealWorld {
    func test() {
        let cartManager = CartManager()

        let navigationBar = UINavigationBar()
        let cartVC = CartViewController()

        cartManager.add(subscriber: navigationBar)
        cartManager.add(subscriber: cartVC)

        let apple = Food(id: 111, name: "Apple", price: 10, calories: 20)
        cartManager.add(product: apple)

        let tShirt = Clothes(id: 222, name: "T-shirt", price: 200, size: "L")
        cartManager.add(product: tShirt)

        cartManager.remove(product: apple)
    }
}

protocol CartSubscriber: CustomStringConvertible {
    func accept(changed cart: [Product])
}

protocol Product {
    var id: Int { get }
    var name: String { get }
    var price: Double { get }

    func isEqual(to product: Product) -> Bool
}

extension Product {
    func isEqual(to product: Product) -> Bool {
        return id == product.id
    }
}

struct Food: Product {
    var id: Int
    var name: String
    var price: Double

    /// Food-specific properties
    var calories: Int
}

struct Clothes: Product {
    var id: Int
    var name: String
    var price: Double

    /// Clothes-specific properties
    var size: String
}

class CartManager {
    private lazy var cart = [Product]()
    private lazy var subscribers = [CartSubscriber]()

    func add(subscriber: CartSubscriber) {
        print("CartManager: I'am adding a new subscriber: \(subscriber.description)")
        subscribers.append(subscriber)
    }

    func add(product: Product) {
        print("\nCartManager: I'am adding a new product: \(product.name)")
        cart.append(product)
        notifySubscribers()
    }

    func remove(subscriber filter: (CartSubscriber) -> (Bool)) {
        guard let index = subscribers.firstIndex(where: filter) else { return }
        subscribers.remove(at: index)
    }

    func remove(product: Product) {
        guard let index = cart.firstIndex(where: { $0.isEqual(to: product) }) else { return }
        print("\nCartManager: Product '\(product.name)' is removed from a cart")
        cart.remove(at: index)
        notifySubscribers()
    }

    private func notifySubscribers() {
        subscribers.forEach({ $0.accept(changed: cart) })
    }
}

extension UINavigationBar: CartSubscriber {
    func accept(changed cart: [Product]) {
        print("UINavigationBar: Updating an appearance of navigation items")
    }

    open override var description: String { return "UINavigationBar" }
}

class CartViewController: UIViewController, CartSubscriber {
    func accept(changed cart: [Product]) {
        print("CartViewController: Updating an appearance of a list view with products")
    }

    open override var description: String { return "CartViewController" }
}
