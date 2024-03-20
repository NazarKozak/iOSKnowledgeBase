//
//  Iterator.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Iterator is a behavioral design pattern that allows sequential traversal through a complex data structure without exposing its internal details.
/// Thanks to the Iterator, clients can go over elements of different collections in a similar fashion using a single iterator interface.
/// Usage examples: The pattern is very common in Swift code. Many frameworks and libraries use it to provide a standard way for traversing their collections.
/// Identification: Iterator is easy to recognize by the navigation methods (such as next, previous and others). Client code that uses iterators might not have direct access to the collection being traversed.

import Foundation

class IteratorRealWorld {
    func test() {
        let tree = Tree(1)
        tree.left = Tree(2)
        tree.right = Tree(3)

        print("Tree traversal: Inorder")
        clientCode(iterator: tree.iterator(.inOrder))

        print("\nTree traversal: Preorder")
        clientCode(iterator: tree.iterator(.preOrder))

        print("\nTree traversal: Postorder")
        clientCode(iterator: tree.iterator(.postOrder))
    }

    func clientCode<T>(iterator: AnyIterator<T>) {
        while case let item? = iterator.next() {
            print(item)
        }
    }
}

class Tree<T> {
    var value: T
    var left: Tree<T>?
    var right: Tree<T>?

    init(_ value: T) {
        self.value = value
    }

    typealias Block = (T) -> ()

    enum IterationType {
        case inOrder
        case preOrder
        case postOrder
    }

    func iterator(_ type: IterationType) -> AnyIterator<T> {
        var items = [T]()
        switch type {
        case .inOrder:
            inOrder { items.append($0) }
        case .preOrder:
            preOrder { items.append($0) }
        case .postOrder:
            postOrder { items.append($0) }
        }

        /// Note:
        /// AnyIterator is used to hide the type signature of an internal
        /// iterator.
        return AnyIterator(items.makeIterator())
    }

    private func inOrder(_ body: Block) {
        left?.inOrder(body)
        body(value)
        right?.inOrder(body)
    }

    private func preOrder(_ body: Block) {
        body(value)
        left?.inOrder(body)
        right?.inOrder(body)
    }

    private func postOrder(_ body: Block) {
        left?.inOrder(body)
        right?.inOrder(body)
        body(value)
    }
}
