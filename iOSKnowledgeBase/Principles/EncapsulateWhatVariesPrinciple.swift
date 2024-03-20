//
//  EncapsulateWhatVaries.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 19.03.2024.
//

/// "Encapsulate what varies" is a principle from the "Strategy" design pattern. It suggests that you should encapsulate the parts of your code that are subject to change. By encapsulating these variations, you make your code more flexible and easier to maintain because you can change those parts without affecting the rest of the codebase.
/// Let's consider an example in Swift where we encapsulate the behavior that varies using the Strategy pattern:
/// Suppose we have a video game where characters can perform different types of attacks, such as melee attacks and ranged attacks. We'll encapsulate the attack behavior using the Strategy pattern.
/// In this example:
/// We define a AttackStrategy protocol representing different attack behaviors.
/// We provide two concrete implementations of AttackStrategy: MeleeAttackStrategy and RangedAttackStrategy.
/// The Character class encapsulates the attack behavior by holding a reference to an object conforming to the AttackStrategy protocol. This allows us to change the attack behavior dynamically.
/// By encapsulating the attack behavior, we can easily swap between melee and ranged attacks without modifying the Character class. This adheres to the principle of "encapsulate what varies" by isolating the parts of the code that are subject to change.

// Protocol defining the attack behavior
protocol EWVAttackStrategy {
    func performAttack()
}

// Concrete implementation of melee attack
struct EWVMeleeAttackStrategy: EWVAttackStrategy {
    func performAttack() {
        print("Performs a melee attack!")
    }
}

// Concrete implementation of ranged attack
struct EWVRangedAttackStrategy: EWVAttackStrategy {
    func performAttack() {
        print("Performs a ranged attack!")
    }
}

// Character class
class EWVCharacter {
    var attackStrategy: EWVAttackStrategy

    init(attackStrategy: EWVAttackStrategy) {
        self.attackStrategy = attackStrategy
    }

    func performAttack() {
        attackStrategy.performAttack()
    }
}

// Usage
//let meleeCharacter = EWVCharacter(attackStrategy: EWVMeleeAttackStrategy())
//meleeCharacter.performAttack()
//
//let rangedCharacter = EWVCharacter(attackStrategy: EWVRangedAttackStrategy())
//rangedCharacter.performAttack()
