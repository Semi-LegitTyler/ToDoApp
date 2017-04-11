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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTaskButton(_ sender: Any) {
        //Creates a new task based on outlet info
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameText.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
