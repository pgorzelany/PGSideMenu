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
    
    unowned let sideMenu: PGSideMenu
    
    var maxAbsoluteContentTranslation: CGFloat {
        return UIScreen.main.bounds.width * sideMenu.menuPercentWidth
    }
    
    let menuTilt: CGFloat = 45
    
    var initialContentTranslation: CGFloat = 0
    
    var animating = false
    
    // MARK: Lifecycle
    
    required init(sideMenu: PGSideMenu) {
        self.sideMenu = sideMenu
    }
    
    // MARK: Methods
    
    func translateContentView(inXDimension x: CGFloat, animated: Bool) {
        
            
    }
    
}

// MARK: PGSideMenuAnimationDelegate

extension PGSideMenuSlideInRotateAnimator: PGSideMenuAnimationDelegate {
    
    func toggleMenu(side: Side) {
        
        if self.isLeftMenuOpen || self.isRightMenuOpen {
            
            self.closeMenu()
            
        } else {
            
            side == .left ? self.openLeftMenu() : self.openRightMenu()
            
        }
    }
    
    func toggleLeftMenu(animated: Bool = true) {
        
        self.isLeftMenuOpen ? self.closeLeftMenu() : self.openLeftMenu()
    }
    
    func openLeftMenu(animated: Bool = true) {
        
        
    }
    
    func closeLeftMenu(animated: Bool = true) {
        
        self.closeMenu(animated: true)
    }
    
    var isLeftMenuOpen: Bool {
        
        return sideMenu.contentViewCenterConstraint.constant == self.maxAbsoluteContentTranslation
    }
    
    func toggleRightMenu(animated: Bool = true) {
        
        self.isRightMenuOpen ? self.closeRightMenu() : self.openRightMenu()
    }
    
    func openRightMenu(animated: Bool = true) {
        
    }
    
    func closeRightMenu(animated: Bool = true) {
        
        self.closeMenu()
    }
    
    var isRightMenuOpen: Bool {
        
        return sideMenu.contentViewCenterConstraint.constant == -self.maxAbsoluteContentTranslation
    }
    
    func closeMenu(animated: Bool = true) {
        
        
    }
    
    func sideMenu(panGestureRecognized: UIPanGestureRecognizer) {
        
        
    }
}
