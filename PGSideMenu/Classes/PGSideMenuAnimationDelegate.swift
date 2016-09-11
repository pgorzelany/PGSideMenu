//
//  PGSideMenuAnimationDelegate.swift
//  Pods
//
//  Created by Piotr Gorzelany on 11/09/16.
//
//

import Foundation
import UIKit

protocol PGSideMenuAnimationDelegate: class {
    
    init(sideMenu: PGSideMenu)
    
    var sideMenu: PGSideMenu {get}
    
    func toggleLeftMenu(controller: PGSideMenu)
    func openLeftMenu(controller: PGSideMenu)
    func closeLeftMenu(controller: PGSideMenu)
    var isLeftMenuOpen: Bool {get}
    
    func toggleRightMenu(controller: PGSideMenu)
    func openRightMenu(controller: PGSideMenu)
    func closeRightMenu(controller: PGSideMenu)
    var isRightMenuOpen: Bool {get}
    
    func hideMenu(controller: PGSideMenu)
    
    func sideMenu(controller: PGSideMenu, panGestureRecognized: UIPanGestureRecognizer)
}
