//
//  Adapter.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Adapter acts as a wrapper between two objects. It catches calls for one object and transforms them to format and interface recognizable by the second object.
/// Usage examples: The Adapter pattern is pretty common in Swift code. It’s very often used in systems based on some legacy code. In such cases, 
/// Adapters make legacy code work with modern classes.
/// Identification: Adapter is recognizable by a constructor which takes an instance of a different abstract/interface type.
/// When adapter receives a call to any of its methods, it translates parameters to appropriate format and then directs the call to one or several methods of the wrapped object.


import Foundation

/// The Target defines the domain-specific interface used by the client code.
class AdapterTarget {
    func request() -> String {
        "Target: The default target's behavior."
    }
}

/// The Adaptee contains some useful behavior, but its interface is incompatible
/// with the existing client code. The Adaptee needs some adaptation before the
/// client code can use it.
class AdapterAdaptee {
    func specificRequest() -> String {
        ".eetpadA eht fo roivaheb laicepS"
    }
}

/// The Adapter makes the Adaptee's interface compatible with the Target's
/// interface.
class AdapterAdapter: AdapterTarget {
    private var adaptee: AdapterAdaptee

    init(_ adaptee: AdapterAdaptee) {
        self.adaptee = adaptee
    }

    override func request() -> String {
        "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}

/// The client code supports all classes that follow the Target interface.
class AdapterClient {
    // ...
    static func someClientCode(target: AdapterTarget) {
        print(target.request())
    }
    // ...
}
