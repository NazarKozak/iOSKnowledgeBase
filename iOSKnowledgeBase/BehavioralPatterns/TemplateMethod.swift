//
//  TemplateMethod.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Template Method is a behavioral design pattern that allows you to defines a skeleton of an algorithm in a base class and let subclasses override the steps without changing the overall algorithm’s structure.
/// Usage examples: The Template Method pattern is quite common in Swift frameworks. Developers often use it to provide framework users with a simple means of extending standard functionality using inheritance.
/// Identification: Template Method can be recognized if you see a method in base class that calls a bunch of other methods that are either abstract or empty.

import Foundation
import AVFoundation
import CoreLocation
import Photos

class TemplateMethodRealWorld {
    /// A good example of Template Method is a life cycle of UIViewController
    func testTemplateMethodReal() {
        let accessors = [CameraAccessor(), MicrophoneAccessor(), PhotoLibraryAccessor()]

        accessors.forEach { item in
            item.requestAccessIfNeeded({ status in
                let message = status ? "You have access to " : "You do not have access to "
                print(message + item.description + "\n")
            })
        }
    }
}

class PermissionAccessor: CustomStringConvertible {
    typealias Completion = (Bool) -> ()

    func requestAccessIfNeeded(_ completion: @escaping Completion) {
        guard !hasAccess() else { completion(true); return }

        willReceiveAccess()

        requestAccess { status in
            status ? self.didReceiveAccess() : self.didRejectAccess()

            completion(status)
        }
    }

    func requestAccess(_ completion: @escaping Completion) {
        fatalError("Should be overridden")
    }

    func hasAccess() -> Bool {
        fatalError("Should be overridden")
    }

    var description: String { return "PermissionAccessor" }

    /// Hooks
    func willReceiveAccess() {}

    func didReceiveAccess() {}

    func didRejectAccess() {}
}

class CameraAccessor: PermissionAccessor {
    override func requestAccess(_ completion: @escaping Completion) {
        AVCaptureDevice.requestAccess(for: .video) { status in
            return completion(status)
        }
    }

    override func hasAccess() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }

    override var description: String { return "Camera" }
}

class MicrophoneAccessor: PermissionAccessor {

    override func requestAccess(_ completion: @escaping Completion) {
        AVAudioSession.sharedInstance().requestRecordPermission { status in
            completion(status)
        }
    }

    override func hasAccess() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .granted
    }

    override var description: String { return "Microphone" }
}

class PhotoLibraryAccessor: PermissionAccessor {
    override func requestAccess(_ completion: @escaping Completion) {
        PHPhotoLibrary.requestAuthorization { status in
            completion(status == .authorized)
        }
    }

    override func hasAccess() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .authorized
    }

    override var description: String { return "PhotoLibrary" }

    override func didReceiveAccess() {
        /// We want to track how many people give access to the PhotoLibrary.
        print("PhotoLibrary Accessor: Receive access. Updating analytics...")
    }

    override func didRejectAccess() {
        /// ... and also we want to track how many people rejected access.
        print("PhotoLibrary Accessor: Rejected with access. Updating analytics...")
    }
}
