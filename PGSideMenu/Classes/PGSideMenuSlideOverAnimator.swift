//
//  PGSideMenuSlideOverAnimator.swift
//  Pods
//
//  Created by Piotr Gorzelany on 13/09/16.
//
//

import Foundation

class PGSideMenuSlideOverAnimator: PGSideMenuAnimationDelegate {
    
    // MARK: Properties
    
    let sideMenu: PGSideMenu
    
    var isLeftMenuOpen: Bool {
        return self.sideMenu.leftMenuTrailingConstraint.constant == self.maxAbsoluteContentTranslation
    }
    
    var isRightMenuOpen: Bool {
        return self.sideMenu.rightMenuLeadingConstraint.constant == -self.maxAbsoluteContentTranslation
    }
    
    var isMenuOpen: Bool {
        return self.isLeftMenuOpen || self.isRightMenuOpen
    }
    
    var maxAbsoluteContentTranslation: CGFloat {
        return UIScreen.main.bounds.width * sideMenu.menuPercentWidth
    }
    
    var initialContentTranslation: CGFloat = 0
    
    // MARK: Lifecycle
    
    required init(sideMenu: PGSideMenu) {
        self.sideMenu = sideMenu
        
        self.configureSideMenu()
    }
    
    // MARK: Methods
    
    func configureSideMenu() {
        
        self.sideMenu.leftMenuWidthConstraint.constant = self.maxAbsoluteContentTranslation
        self.sideMenu.rightMenuWidthConstraint.constant = self.maxAbsoluteContentTranslation
    }
    
    func toggleLeftMenu(animated: Bool) {
        
        guard !self.isMenuOpen else {
            self.hideMenu(animated: animated)
            return
        }
        
        self.openLeftMenu(animated: animated)
    }
    
    func toggleRightMenu(animated: Bool) {
        
        guard !self.isMenuOpen else {
            self.hideMenu(animated: animated)
            return
        }
        
        self.openRightMenu(animated: animated)
    }
    
    func openLeftMenu(animated: Bool) {
        
        self.translateContentView(by: self.maxAbsoluteContentTranslation, animated: animated)
        
    }
    
    func openRightMenu(animated: Bool) {
        
        self.translateContentView(by: -self.maxAbsoluteContentTranslation, animated: animated)
    }
    
    func translateContentView(by x: CGFloat, animated: Bool) {
        
        guard abs(x) <= self.maxAbsoluteContentTranslation else {return}
        
        self.sideMenu.contentViewCenterConstraint.constant = x
        
        if animated {
            
            UIView.animate(withDuration: self.sideMenu.menuAnimationDuration, delay: 0, options: self.sideMenu.menuAnimationOptions, animations: {
                
                self.sideMenu.view.layoutIfNeeded()
                
                }, completion: nil)
            
        }
    }
    
    func hideMenu(animated: Bool) {
        
        self.sideMenu.leftMenuTrailingConstraint.constant = 0
        self.sideMenu.rightMenuLeadingConstraint.constant = 0
        
        if animated {
            
            UIView.animate(withDuration: self.sideMenu.menuAnimationDuration, delay: 0, options: self.sideMenu.menuAnimationOptions, animations: {
                
                self.sideMenu.view.layoutIfNeeded()
                
                }, completion: nil)
            
        }
    }
    
    func sideMenu(panGestureRecognized recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.sideMenu.view)
        
        switch recognizer.state {
            
        case .began:
            self.initialContentTranslation = self.sideMenu.contentViewCenterConstraint.constant
        case .changed:
            self.translateContentView(by: translation.x + self.initialContentTranslation, animated: false)
        case .ended:
            self.handlePanGestureEnd()
        default: break
            
        }
    }
    
    func handlePanGestureEnd() {
        
        if abs(self.sideMenu.contentViewCenterConstraint.constant) > self.maxAbsoluteContentTranslation / 2.0 {
            
            // Almost opened
            
            self.sideMenu.contentViewCenterConstraint.constant > 0 ? self.openLeftMenu(animated: true) : self.openRightMenu(animated: true)
            
            
        } else {
            
            self.hideMenu(animated: true)
            
        }
    }
    
}
