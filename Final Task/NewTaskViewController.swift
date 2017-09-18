//
//  NewTaskViewController.swift
//  Final Task
//
//  Created by Casey Diaz on 9/13/17.
//  Copyright © 2017 Casey Diaz. All rights reserved.
//

import UIKit
import CoreData

class NewTaskViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    var tasks = [NSManagedObject]()
    
    override func viewDidLoad() {
        
        nameTextField.layer.cornerRadius = 8
        nameTextField.layer.borderWidth = 1
        descriptionTextField.layer.cornerRadius = 8
        descriptionTextField.layer.borderWidth = 1
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let name = nameTextField.text! as String
        let description = descriptionTextField.text! as String
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)
        
        let task = NSManagedObject(entity: entity!, insertInto: context)
        
        let alertController = UIAlertController(title: "Task added.", message: nil, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: {
            
            (alert) in
            task.setValue(name, forKey: "taskName")
            task.setValue(description, forKey: "taskDescription")
            appDelegate.saveContext()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
            self.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(okayAction)
        
        present(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
