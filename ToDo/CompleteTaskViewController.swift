//
//  CompleteTaskViewController.swift
//  ToDo
//
//  Created by Tyler Lang on 4/10/17.
//  Copyright © 2017 Tyler Lang. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    var task : Task? = nil
    
    @IBOutlet weak var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskLabel.text = task!.name!
    }
    
    @IBAction func completeButton(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
