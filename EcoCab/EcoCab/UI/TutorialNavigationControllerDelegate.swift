//
//  TutorialNavigationControllerDelegate.swift
//  EcoCab
//
//  Created by Arcilite on 22.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit

class TutorialNavigationControllerDelegate: NSObject,UINavigationControllerDelegate {
    
    var navigationController : UINavigationController!
    var animator = TutorialAnimation()
    
    @objc func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool){
    
    }
    
   @objc func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool){
    
    }
   

   
    @objc func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        

        
        return nil
    }
    
//
    @objc func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        switch(operation){
        case .Pop:
              self.animator.direction = .Right
             return self.animator;
        case .Push:
               self.animator.direction = .Left
             return self.animator;
        default: break
        }
        
       
     return nil
    }
    
}
