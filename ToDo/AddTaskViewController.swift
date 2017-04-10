//
//  AddTaskViewController.swift
//  ToDo
//
//  Created by Tyler Lang on 4/10/17.
//  Copyright © 2017 Tyler Lang. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameText: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTaskButton(_ sender: Any) {
        //Creates a new task based on outlet info
        
        let task = Task()
        task.name = taskNameText.text!
        task.importance = importantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
