//
//  Facade.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Facade is a structural design pattern that provides a simplified (but limited) interface to a complex system of classes, library or framework.
/// While Facade decreases the overall complexity of the application, it also helps to move unwanted dependencies to one place.
/// Usage examples: The Facade pattern is commonly used in apps written in Swift. It’s especially handy when working with complex libraries and APIs.
/// Identification: Facade can be recognized in a class that has a simple interface, but delegates most of the work to other classes. 
/// Usually, facades manage the full life cycle of objects they use.

import UIKit

/// Facade Design Pattern
///
/// Intent: Provides a simplified interface to a library, a framework, or any
/// other complex set of classes.

class FacadeRealWorld {
    /// In the real project, you probably will use third-party libraries. For
    /// instance, to download images.
    ///
    /// Therefore, facade and wrapping it is a good way to use a third party API
    /// in the client code. Even if it is your own library that is connected to
    /// a project.
    ///
    /// The benefits here are:
    ///
    /// 1) If you need to change a current image downloader it should be done
    /// only in the one place of a project. A number of lines of the client code
    /// will stay work.
    ///
    /// 2) The facade provides an access to a fraction of a functionality that
    /// fits most client needs. Moreover, it can set frequently used or default
    /// parameters.

    func testFacedeRealWorld() {
        let imageView = UIImageView()
        print("Let's set an image for the image view")
        clientCode(imageView)
        print("Image has been set")
    }

    fileprivate func clientCode(_ imageView: UIImageView) {
        let url = URL(string: "www.example.com/logo")
        imageView.downloadImage(at: url)
    }
}

private extension UIImageView {
    /// This extension plays a facede role.

    func downloadImage(at url: URL?) {
        print("Start downloading...")
        let placeholder = UIImage(named: "placeholder")

        ImageDownloader().loadImage(at: url,
                                    placeholder: placeholder,
                                    completion: { image, error in
            print("Handle an image...")

            /// Crop, cache, apply filters, whatever...
            self.image = image
        })
    }
}

private class ImageDownloader {
    /// Third party library or your own solution (subsystem)

    typealias Completion = (UIImage, Error?) -> ()
    typealias Progress = (Int, Int) -> ()

    func loadImage(at url: URL?,
                   placeholder: UIImage? = nil,
                   progress: Progress? = nil,
                   completion: Completion) {
        /// ... Set up a network stack
        /// ... Downloading an image
        /// ...
        completion(UIImage(), nil)
    }
}
