//
//  Memento.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 20.03.2024.
//

/// Memento is a behavioral design pattern that allows making snapshots of an object’s state and restoring it in future.
/// The Memento doesn’t compromise the internal structure of the object it works with, as well as data kept inside the snapshots.
/// Usage examples: The Memento’s principle can be achieved using serialization, which is quite common in Swift. While it’s not the only and the most efficient way to make snapshots of an object’s state, it still allows storing state backups while protecting the originator’s structure from other objects.

import UIKit

class MementoRealWorld {
    /// State and Command are often used together when the previous state of the
    /// object should be restored in case of failure of some operation.
    ///
    /// Note: UndoManager can be used as an alternative.

    func test() {
        let textView = UITextView()
        let undoStack = UndoStack(textView)

        textView.text = "First Change"
        undoStack.save()

        textView.text = "Second Change"
        undoStack.save()

        textView.text = (textView.text ?? "") + " & Third Change"
        textView.textColor = .red
        undoStack.save()

        print(undoStack)

        print("Client: Perform Undo operation 2 times\n")
        undoStack.undo()
        undoStack.undo()

        print(undoStack)
    }
}

class UndoStack: CustomStringConvertible {
    private lazy var mementos = [Memento]()
    private let textView: UITextView

    init(_ textView: UITextView) {
        self.textView = textView
    }

    func save() {
        mementos.append(textView.memento)
    }

    func undo() {
        guard !mementos.isEmpty else { return }
        textView.restore(with: mementos.removeLast())
    }

    var description: String {
        return mementos.reduce("", { $0 + $1.description })
    }
}

protocol Memento: CustomStringConvertible {
    var text: String { get }
    var date: Date { get }
}

extension UITextView {
    var memento: Memento {
        return TextViewMemento(text: text,
                               textColor: textColor,
                               selectedRange: selectedRange)
    }

    func restore(with memento: Memento) {
        guard let textViewMemento = memento as? TextViewMemento else { return }

        text = textViewMemento.text
        textColor = textViewMemento.textColor
        selectedRange = textViewMemento.selectedRange
    }

    struct TextViewMemento: Memento {
        let text: String
        let date = Date()

        let textColor: UIColor?
        let selectedRange: NSRange

        var description: String {
            let time = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond],
                                                       from: date)
            let color = String(describing: textColor)
            return "Text: \(text)\n" + "Date: \(time.description)\n"
                + "Color: \(color)\n" + "Range: \(selectedRange)\n\n"
        }
    }
}
