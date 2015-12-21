//
//  EcoCabNavigationViewController.swift
//  EcoCab
//
//  Created by Arcilite on 19.12.15.
//  Copyright © 2015 Arcilite. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class EcoCabNavigationViewController: ENSideMenuNavigationController, ENSideMenuDelegate  {


  
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MenuViewController")
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menuViewController, menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        sideMenu?.bouncingEnabled = false
        sideMenu?.allowPanGesture = true
        // make navigation bar showing over side menu
       // view.bringSubviewToFront(navigationBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
}



}
