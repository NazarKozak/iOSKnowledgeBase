//
//  Prototype.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// The Prototype pattern is a creational design pattern that allows you to create new objects by copying an existing object, known as the prototype. It specifies a mechanism for creating new objects based on an existing object, avoiding the need for subclassing.
/// Here's a brief description of how the Prototype pattern works:
/// Prototype Interface: Defines an interface for cloning itself. This can be an abstract class or a protocol.
/// Concrete Prototype: Implements the clone method to create a new object by copying itself.
/// Client: Requests new objects to be created by cloning the prototype.
/// The Prototype pattern allows you to create new objects with minimal configuration and without explicitly calling a constructor.

import Foundation

private class PrototypeAuthor {
    private var id: Int
    private var username: String
    private var pages = [PrototypePage]()

    init(id: Int, username: String) {
        self.id = id
        self.username = username
    }

    func add(page: PrototypePage) {
        pages.append(page)
    }

    var pagesCount: Int {
        return pages.count
    }
}

private class PrototypePage: NSCopying {
    private(set) var title: String
    private(set) var contents: String
    private weak var author: PrototypeAuthor?
    private(set) var comments = [PrototypeComment]()

    init(title: String, contents: String, author: PrototypeAuthor?) {
        self.title = title
        self.contents = contents
        self.author = author
        author?.add(page: self)
    }

    func add(comment: PrototypeComment) {
        comments.append(comment)
    }

    /// MARK: - NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        return PrototypePage(title: "Copy of '" + title + "'", contents: contents, author: author)
    }
}

private struct PrototypeComment {
    let date = Date()
    let message: String
}
