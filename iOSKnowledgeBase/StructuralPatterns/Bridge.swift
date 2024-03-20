//
//  Bridge.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Bridge is a structural design pattern that divides business logic or huge class into separate class hierarchies that can be developed independently.
/// One of these hierarchies (often called the Abstraction) will get a reference to an object of the second hierarchy (Implementation). 
/// The abstraction will be able to delegate some (sometimes, most) of its calls to the implementations object.
/// Since all implementations will have a common interface, they’d be interchangeable inside the abstraction.

import UIKit

private class BridgeRealWorld {
    func push(_ container: SharingSupportable) {
        let instagram = InstagramSharingService()
        let facebook = FaceBookSharingService()

        container.accept(service: instagram)
        container.update(content: foodModel)

        container.accept(service: facebook)
        container.update(content: foodModel)
    }

    var foodModel: BridgeContent {
        FoodDomainModel(title: "This food is so various and delicious!",
                               images: [UIImage(), UIImage()],
                               calories: 47)
    }
}

private protocol SharingSupportable {
    /// Abstraction
    func accept(service: SharingService)
    func update(content: BridgeContent)
}

class BaseViewController: UIViewController, SharingSupportable {
    fileprivate var shareService: SharingService?

    func update(content: BridgeContent) {
        /// ...updating UI and showing a content...
        /// ...
        /// ... then, a user will choose a content and trigger an event
        print("\(description): User selected a \(content) to share")
        /// ...
        shareService?.share(content: content)
    }

    func accept(service: SharingService) {
        shareService = service
    }
}

class PhotoViewController: BaseViewController {
    /// Custom UI and features
    override var description: String {
        return "PhotoViewController"
    }
}

class FeedViewController: BaseViewController {
    /// Custom UI and features
    override var description: String {
        return "FeedViewController"
    }
}

protocol SharingService {
    /// Implementation
    func share(content: BridgeContent)
}

class FaceBookSharingService: SharingService {

    func share(content: BridgeContent) {

        /// Use FaceBook API to share a content
        print("Service: \(content) was posted to the Facebook")
    }
}

class InstagramSharingService: SharingService {
    func share(content: BridgeContent) {
        /// Use Instagram API to share a content
        print("Service: \(content) was posted to the Instagram", terminator: "\n\n")
    }
}

protocol BridgeContent: CustomStringConvertible {
    var title: String { get }
    var images: [UIImage] { get }
}

struct FoodDomainModel: BridgeContent {
    var title: String
    var images: [UIImage]
    var calories: Int

    var description: String {
        "Food Model"
    }
}
