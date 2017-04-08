//
//  AppDelegate.swift
//  PGSideMenu
//
//  Created by pgorzelany on 05/27/2016.
//  Copyright (c) 2016 pgorzelany. All rights reserved.
//

import UIKit
import PGSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        self.loadExampleAppStructure()
        return true
    }

    fileprivate func loadExampleAppStructure() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        let sideMenuController = PGSideMenu(animationType: .slideIn)
        let contentController = ContentController()
        let leftMenuController = LeftMenuController()
        let rightMenuController = RightMenuController()
        sideMenuController.addContentController(contentController)
        sideMenuController.addLeftMenuController(leftMenuController)
        sideMenuController.addRightMenuController(rightMenuController)
        self.window?.rootViewController = sideMenuController
    }
}

