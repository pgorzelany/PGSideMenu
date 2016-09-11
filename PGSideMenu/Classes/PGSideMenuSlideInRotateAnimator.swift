//
//  PGSideMenuSlideInRotateAnimator.swift
//  Pods
//
//  Created by Piotr Gorzelany on 11/09/16.
//
//

import Foundation

class PGSideMenuSlideInRotateAnimator {
    
    // MARK: Properties
    
    let sideMenu: PGSideMenu
    
    // MARK: Lifecycle
    
    init(sideMenu: PGSideMenu) {
        self.sideMenu = sideMenu
    }
    
}

// MARK: PGSideMenuAnimationDelegate

extension PGSideMenuSlideInRotateAnimator: PGSideMenuAnimationDelegate {
    
    func toggleLeftMenu(controller: PGSideMenu) {
        
    }
    
    func openLeftMenu(controller: PGSideMenu) {
        
    }
    
    func closeLeftMenu(controller: PGSideMenu) {
        
        
    }
    
    var isLeftMenuOpen: Bool {
        return false
    }
    
    func toggleRightMenu(controller: PGSideMenu) {
        
    }
    
    func openRightMenu(controller: PGSideMenu) {
        
    }
    
    func closeRightMenu(controller: PGSideMenu) {
        
    }
    
    var isRightMenuOpen: Bool {
        return false
    }
    
    func hideMenu(controller: PGSideMenu) {
        
    }
    
    func sideMenu(controller: PGSideMenu, panGestureRecognized: UIPanGestureRecognizer) {
        
        
    }
}
