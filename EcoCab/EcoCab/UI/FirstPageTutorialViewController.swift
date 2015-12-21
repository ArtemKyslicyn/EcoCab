//
//  FirstTutorialViewController.swift
//  EcoCab
//
//  Created by Arcilite on 20.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit

class FirstPageTutorialViewController: UIViewController {
    @IBOutlet var rightGestureRecognizer: UISwipeGestureRecognizer!

    @IBAction func swipeRightAction(sender: AnyObject) {
          self.performSegueWithIdentifier("SecondScreen", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRightAction:")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGestureRecognizer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
