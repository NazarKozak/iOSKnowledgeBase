//
//  Builder.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Builder pattern is a creational design pattern used to construct complex objects step by step. It separates the construction of a complex object from its representation, allowing the same construction process to create different representations of the object. This pattern is useful when the construction of an object involves multiple steps or configurations, and you want to provide a flexible and fluent interface for creating objects.

/// Here's a brief description of how the Builder pattern works:
/// Builder: Defines an abstract interface for creating parts of a complex object.
/// Concrete Builders: Implement the builder interface to construct and assemble the parts of the complex object.
/// Director: Manages the construction process using a builder to create the complex object.
/// Product: Represents the complex object being constructed.
///
/// In this example:
/// Pizza represents the complex object being constructed.
/// PizzaBuilder is the builder protocol defining the interface for building a pizza.
/// HawaiianPizzaBuilder is a concrete builder that implements PizzaBuilder to construct a Hawaiian pizza.
/// PizzaDirector manages the construction process using a builder to create the pizza.
/// The client code creates a HawaiianPizzaBuilder, passes it to the PizzaDirector to construct a pizza, and then describes the pizza.
/// The Builder pattern allows you to create complex objects with a flexible and fluent interface, providing control over the construction process while keeping the construction code separate from the product's representation.

import Foundation

// Product
struct BPizza {
    var dough: String
    var sauce: String
    var toppings: [String]

    func describe() {
        print("Pizza with \(dough) dough, \(sauce) sauce, and toppings: \(toppings.joined(separator: ", "))")
    }
}

// Builder protocol
protocol BPizzaBuilder {
    func setDough(_ dough: String)
    func setSauce(_ sauce: String)
    func addTopping(_ topping: String)
    func build() -> BPizza
}

// Concrete builder
class BHawaiianPizzaBuilder: BPizzaBuilder {
    private var pizza: BPizza

    init() {
        pizza = BPizza(dough: "", sauce: "", toppings: [])
    }

    func setDough(_ dough: String) {
        pizza.dough = dough
    }

    func setSauce(_ sauce: String) {
        pizza.sauce = sauce
    }

    func addTopping(_ topping: String) {
        pizza.toppings.append(topping)
    }

    func build() -> BPizza {
        return pizza
    }
}

// Director
class BPizzaDirector {
    func makePizza(builder: BPizzaBuilder) -> BPizza {
        builder.setDough("Thin")
        builder.setSauce("Tomato")
        builder.addTopping("Ham")
        builder.addTopping("Pineapple")
        return builder.build()
    }
}

// Usage
//let hawaiianPizzaBuilder = BHawaiianPizzaBuilder()
//let pizzaDirector = BPizzaDirector()
//let hawaiianPizza = pizzaDirector.makePizza(builder: hawaiianPizzaBuilder)
//hawaiianPizza.describe()
