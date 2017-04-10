//
//  CompleteTaskViewController.swift
//  ToDo
//
//  Created by Tyler Lang on 4/10/17.
//  Copyright © 2017 Tyler Lang. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var previousVC = ViewController()
    var task = Task()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func completeButton(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskLabel.text = task.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
