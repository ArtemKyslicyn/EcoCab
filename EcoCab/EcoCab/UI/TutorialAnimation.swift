//
//  TutorialAnimation.swift
//  EcoCab
//
//  Created by Arcilite on 22.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore

enum TurorPageSwipeDirection:CGFloat{
    case Left = -1
    case Right = 1
}




   var animationTransitionOptions: UIViewAnimationOptions = .TransitionCrossDissolve

    class TutorialAnimation: NSObject , UIViewControllerAnimatedTransitioning {
    
    
        var direction:TurorPageSwipeDirection!
        
       
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 1
    }
    
    @objc func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        let container = transitionContext.containerView()!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let  toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
         toViewController!.view.frame = transitionContext.finalFrameForViewController(toViewController!)
       
        let toView = toViewController!.view
        

        let snapshot = (fromViewController as? TutorialPages)!.tutorialPageView().snapshotViewAfterScreenUpdates(true)
        container.addSubview(toView)
        container.addSubview(snapshot)
       
        let tutorialView = (fromViewController as? TutorialPages)!.tutorialPageView()
        let originalPoint = tutorialView.center
        
        snapshot.center = originalPoint
        let duration = self.transitionDuration(transitionContext)
        var x:CGFloat = 0
        switch (direction!){
            case .Left: x = -700
            case .Right: x = 700
            
        }
       
        let finishPoint = CGPointMake(x,  transitionContext.containerView()!.center.y)
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .AllowAnimatedContent, animations: {
            
            snapshot.transform = CGAffineTransformMakeRotation(self.direction.rawValue)
            snapshot.center = finishPoint
            
            }, completion: { finished in
                snapshot.center = originalPoint
                snapshot.transform = CGAffineTransformMakeRotation(0);
                snapshot.removeFromSuperview()
              
                transitionContext.completeTransition(true)
        })
        
        

    }
    
    
    
    
}