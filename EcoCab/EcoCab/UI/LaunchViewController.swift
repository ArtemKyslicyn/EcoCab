//
//  CrabACabViewController.swift
//  EcoCab
//
//  Created by Arcilite on 19.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         self.performSegueWithIdentifier("FirstScreen", sender: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
