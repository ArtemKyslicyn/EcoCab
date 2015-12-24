//
//  ThirdPageTutorialViewController.swift
//  EcoCab
//
//  Created by Arcilite on 20.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit

class ThirdPageTutorialViewController: UIViewController,TutorialPages {

    @IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var pageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRightGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRightAction:")
        swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRightGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func swipeRightAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func tutorialPageView () -> UIView{
        return pageView
    }
    
    func tutorialBackgroundView () -> UIImageView{
        return backgroundView
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
