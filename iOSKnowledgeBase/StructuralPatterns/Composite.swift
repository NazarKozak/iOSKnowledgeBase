//
//  Composite.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

import Foundation

/// Composite is a structural design pattern that allows composing objects into a tree-like structure and work with the it as if it was a singular object.
/// Composite became a pretty popular solution for the most problems that require building a tree structure. 
/// Composite’s great feature is the ability to run methods recursively over the whole tree structure and sum up the results.

/// Usage examples: The Composite pattern is pretty common in Swift code. It’s often used to represent hierarchies of user interface components or the code that works with graphs.
/// Identification: If you have an object tree, and each object of a tree is a part of the same class hierarchy, this is most likely a composite. 
/// If methods of these classes delegate the work to child objects of the tree and do it via the base class/interface of the hierarchy, this is definitely a composite.

import UIKit

protocol CompositeComponent {
    func accept<T: Theme>(theme: T)
}

extension CompositeComponent where Self: UIViewController {
    func accept<T: Theme>(theme: T) {
        view.accept(theme: theme)
        view.subviews.forEach({ $0.accept(theme: theme) })
    }
}

extension UIView: CompositeComponent {}
extension UIViewController: CompositeComponent {}

extension CompositeComponent where Self: UIView {
    func accept<T: Theme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
    }
}

extension CompositeComponent where Self: UILabel {
    func accept<T: LabelTheme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
        textColor = theme.textColor
    }
}

extension CompositeComponent where Self: UIButton {
    func accept<T: ButtonTheme>(theme: T) {
        print("\t\(description): has applied \(theme.description)")
        backgroundColor = theme.backgroundColor
        setTitleColor(theme.textColor, for: .normal)
        setTitleColor(theme.highlightedColor, for: .highlighted)
    }
}

protocol Theme: CustomStringConvertible {
    var backgroundColor: UIColor { get }
}

protocol ButtonTheme: Theme {
    var textColor: UIColor { get }
    var highlightedColor: UIColor { get }
    /// other properties
}

protocol LabelTheme: Theme {
    var textColor: UIColor { get }
    /// other properties
}

/// Button Themes

struct DefaultButtonTheme: ButtonTheme {
    var textColor = UIColor.red
    var highlightedColor = UIColor.white
    var backgroundColor = UIColor.orange
    var description: String { return "Default Buttom Theme" }
}

struct NightButtonTheme: ButtonTheme {
    var textColor = UIColor.white
    var highlightedColor = UIColor.red
    var backgroundColor = UIColor.black
    var description: String { return "Night Buttom Theme" }
}

/// Label Themes

struct DefaultLabelTheme: LabelTheme {
    var textColor = UIColor.red
    var backgroundColor = UIColor.black
    var description: String { return "Default Label Theme" }
}

struct NightLabelTheme: LabelTheme {
    var textColor = UIColor.white
    var backgroundColor = UIColor.black
    var description: String { return "Night Label Theme" }
}

class CompositeRealWorld {
    func testCompositeRealWorld() {
        print("\nClient: Applying 'default' theme for 'UIButton'")
        apply(theme: DefaultButtonTheme(), for: UIButton())

        print("\nClient: Applying 'night' theme for 'UIButton'")
        apply(theme: NightButtonTheme(), for: UIButton())

        print("\nClient: Let's use View Controller as a composite!")

        /// Night theme
        print("\nClient: Applying 'night button' theme for 'WelcomeViewController'...")
        apply(theme: NightButtonTheme(), for: WelcomeViewController())
        print()

        print("\nClient: Applying 'night label' theme for 'WelcomeViewController'...")
        apply(theme: NightLabelTheme(), for: WelcomeViewController())
        print()

        /// Default Theme
        print("\nClient: Applying 'default button' theme for 'WelcomeViewController'...")
        apply(theme: DefaultButtonTheme(), for: WelcomeViewController())
        print()

        print("\nClient: Applying 'default label' theme for 'WelcomeViewController'...")
        apply(theme: DefaultLabelTheme(), for: WelcomeViewController())
        print()
    }

    func apply<T: Theme>(theme: T, for component: CompositeComponent) {
        component.accept(theme: theme)
    }
}

class WelcomeViewController: UIViewController {
    class ContentView: UIView {
        var titleLabel = UILabel()
        var actionButton = UIButton()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }

        required init?(coder decoder: NSCoder) {
            super.init(coder: decoder)
            setup()
        }

        func setup() {
            addSubview(titleLabel)
            addSubview(actionButton)
        }
    }

    override func loadView() {
        view = ContentView()
    }
}

/// Let's override a description property for the better output

extension WelcomeViewController {
    open override var description: String { return "WelcomeViewController" }
}

extension WelcomeViewController.ContentView {
    override var description: String { return "ContentView" }
}

extension UIButton {
    open override var description: String { return "UIButton" }
}

extension UILabel {
    open override var description: String { return "UILabel" }
}
