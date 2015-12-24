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

//Default values
private let defaultCountOfVisibleCards = 3
private let backgroundCardsTopMargin: CGFloat = 4.0
private let backgroundCardsScalePercent: CGFloat = 0.95
private let backgroundCardsLeftMargin: CGFloat = 8.0
private let backgroundCardFrameAnimationDuration: NSTimeInterval = 0.2

//Opacity values
private let defaultAlphaValueOpaque: CGFloat = 1.0
private let defaultAlphaValueTransparent: CGFloat = 0.0
private let defaultAlphaValueSemiTransparent: CGFloat = 0.7

//Animations constants
private let revertCardAnimationName = "revertCardAlphaAnimation"
private let revertCardAnimationDuration: NSTimeInterval = 1.0
private let revertCardAnimationToValue: CGFloat = 1.0
private let revertCardAnimationFromValue: CGFloat = 0.0

private let kolodaAppearScaleAnimationName = "kolodaAppearScaleAnimation"
private let kolodaAppearScaleAnimationFromValue = CGPoint(x: 0.1, y: 0.1)
private let kolodaAppearScaleAnimationToValue = CGPoint(x: 1.0, y: 1.0)
private let kolodaAppearScaleAnimationDuration: NSTimeInterval = 0.8
private let kolodaAppearAlphaAnimationName = "kolodaAppearAlphaAnimation"
private let kolodaAppearAlphaAnimationFromValue: CGFloat = 0.0
private let kolodaAppearAlphaAnimationToValue: CGFloat = 1.0
private let kolodaAppearAlphaAnimationDuration: NSTimeInterval = 0.8


let AnimatorStartTransform:CATransform3D = {
    let rotationDegrees: CGFloat = -15.0
    let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
    let offset = CGPointMake(-20, -20)
    var startTransform = CATransform3DIdentity
    startTransform = CATransform3DRotate(CATransform3DIdentity,
        rotationRadians, 0.0, 0.0, 1.0)
    startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
    
    return startTransform
    }()

   var animationTransitionOptions: UIViewAnimationOptions = .TransitionCrossDissolve

    class TutorialAnimation: NSObject , UIViewControllerAnimatedTransitioning {
    
    
        var direction:TurorPageSwipeDirection!
        
        class func animate(cell:UITableViewCell) {
        let view = cell.contentView
        
        view.layer.transform = AnimatorStartTransform
        view.layer.opacity = 0.8
        
        UIView.animateWithDuration(0.4) {
            view.layer.transform = AnimatorStartTransform
            view.layer.opacity = 1
        }
        
        
    }
    
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