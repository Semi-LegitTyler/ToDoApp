//
//  ViewController.swift
//  ToDo
//
//  Created by Tyler Lang on 4/8/17.
//  Copyright © 2017 Tyler Lang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importance {
            cell.textLabel?.text = "🚨\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "deleteTaskSegue", sender: task)
        
        
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Finish an App"
        task1.importance = false
        
        let task2 = Task()
        task2.name = "Work at 315"
        task2.importance = true
        
        return [task1,task2]
    }
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskSegue" {
            let nextVC = segue.destination as! AddTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "deleteTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
    
}

