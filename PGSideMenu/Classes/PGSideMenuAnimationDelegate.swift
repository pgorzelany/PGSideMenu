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
    
    func toggleLeftMenu(animated: Bool)
    func openLeftMenu(animated: Bool)
    func closeLeftMenu(animated: Bool)
    var isLeftMenuOpen: Bool {get}
    
    func toggleRightMenu(animated: Bool)
    func openRightMenu(animated: Bool)
    func closeRightMenu(animated: Bool)
    var isRightMenuOpen: Bool {get}
    
    func closeMenu(animated: Bool)
    
    func sideMenu(panGestureRecognized: UIPanGestureRecognizer)
}
