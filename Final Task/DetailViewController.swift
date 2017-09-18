//
//  DetailViewController.swift
//  Final Task
//
//  Created by Casey Diaz on 9/13/17.
//  Copyright © 2017 Casey Diaz. All rights reserved.
//

import UIKit

var taskDescription = "Task Description"
var taskTitle = "Task Title"

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        
        self.detailDescriptionLabel.text = taskDescription
        self.title = taskTitle
        
    }

    override func viewDidLoad() {
        
        configureView()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

