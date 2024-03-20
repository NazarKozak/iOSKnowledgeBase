//
//  YAGNI.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation
import UIKit

/// Imagine you're implementing the task editing feature, and you start by creating a screen that allows users to edit the task's title and description. While implementing this feature, you might be tempted to include additional functionality, such as setting a due date or assigning a priority to the task, even though these features are not part of the initial requirements.
/// However, if you follow the YAGNI principle, you would resist the temptation to add these extra features at this stage. Instead, you would focus solely on implementing the core functionality of editing the task's title and description.
/// In this example, the TaskEditorViewController allows users to edit the title and description of a task, adhering to the core requirements without adding unnecessary complexity. Additional features like setting due dates or priorities can be added later if they become necessary based on user feedback or changing requirements.
/// By following the YAGNI principle, you avoid spending time and effort implementing features that may not be needed, thus keeping your codebase lean and focused on delivering value to the user.

struct Task {
    var title: String
    var description: String
}

class TaskEditorViewController: UIViewController {
    var task: Task

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!

    init(task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        titleTextField.text = task.title
        descriptionTextView.text = task.description
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Update task with edited title and description
        task.title = titleTextField.text ?? ""
        task.description = descriptionTextView.text
        // Save or update task in the database
        // Dismiss the view controller
    }
}
