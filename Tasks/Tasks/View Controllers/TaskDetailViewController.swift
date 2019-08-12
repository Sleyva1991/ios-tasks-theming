//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Andrew R Madsen on 8/11/18.
//  Copyright © 2018 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAppearance()
        updateViews()
    }
    
    private func setUpAppearance() {
        view.backgroundColor = AppearanceHelper.backgroundGray
        
        notesTextView.backgroundColor = AppearanceHelper.backgroundGray
        notesTextView.textColor = AppearanceHelper.limeGreen
        notesTextView.font = AppearanceHelper.architexFont(with: .body, pointSize: 25)
        notesTextView.layer.borderColor = UIColor.white.cgColor
        
        notesTextView.layer.cornerRadius = 12
        notesTextView.keyboardAppearance = .dark
        
        notesLabel.textColor = AppearanceHelper.limeGreen
        priorityLabel.textColor = AppearanceHelper.limeGreen
        nameLabel.textColor = AppearanceHelper.limeGreen
        
        
    }


    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let priorityIndex = priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allPriorities[priorityIndex]
        let notes = notesTextView.text
        
        if let task = task {
            // Editing existing task
            taskController.update(task: task, with: name, notes: notes, priority: priority)
        } else {
            taskController.createTask(with: name, notes: notes, priority: priority)
        }

        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
                
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        let priority: TaskPriority
        if let taskPriority = task?.priority {
            priority = TaskPriority(rawValue: taskPriority)!
        } else {
            priority = .normal
        }
        priorityControl.selectedSegmentIndex = TaskPriority.allPriorities.firstIndex(of: priority)!
        notesTextView.text = task?.notes
    }
    
    // MARK: Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var taskController: TaskController!

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priorityControl: UISegmentedControl!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
}
