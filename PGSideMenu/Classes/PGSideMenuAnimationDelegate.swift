//
//  PGSideMenuAnimationDelegate.swift
//  Pods
//
//  Created by Piotr Gorzelany on 11/09/16.
//
//

import Foundation
import UIKit

enum Side {
    case left, right
}

protocol PGSideMenuAnimationDelegate: class {
    
    init(sideMenu: PGSideMenu)
    
    unowned var sideMenu: PGSideMenu {get}
    
    func toggleLeftMenu(animated: Bool, completion: (() -> Void)?)
    var isLeftMenuOpen: Bool {get}
    
    func toggleRightMenu(animated: Bool, completion: (() -> Void)?)
    var isRightMenuOpen: Bool {get}
    
    func hideMenu(animated: Bool, completion: (() -> Void)?)
    
    func sideMenu(panGestureRecognized: UIPanGestureRecognizer)
}
