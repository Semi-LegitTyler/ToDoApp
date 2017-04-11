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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "🚨\(String(describing: task.name!))"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "deleteTaskSegue", sender: task)
        
        
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "deleteTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
}

