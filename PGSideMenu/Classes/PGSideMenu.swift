    //
//  DoorMenuViewController.swift
//  SwiftDemos
//
//  Created by Piotr Gorzelany on 22/05/16.
//  Copyright © 2016 Piotr Gorzelany. All rights reserved.
//

import UIKit

private enum Side {
    
    case left, right
    
}

open class PGSideMenu: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var leftMenuContainerView: UIView!
    @IBOutlet weak var rightMenuContainerView: UIView!
    
    @IBOutlet weak var contentViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMenuWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightMenuWidthConstraint: NSLayoutConstraint!
    
    // MARK: Public Properties
    
    /** The current content controller */
    open var contentController: UIViewController?
    
    /** Left menu controller */
    open var leftMenuController: UIViewController?
    
    /** Right menu controller */
    open var rightMenuController: UIViewController?
    
    /** The width of the menu container as a percentage of the screen. Min is 0,  max is 1. */
    open var menuPercentWidth: CGFloat = 0.8 {
        didSet {
            menuPercentWidth = min(1, menuPercentWidth)
            menuPercentWidth = max(0, menuPercentWidth)
        }
    }
    
    /** The scale factor for the content view when menu is shown. Min is 0, max is 1. */
    open var contentScaleFactor: CGFloat = 0.9 {
        didSet {
            contentScaleFactor = min(1, contentScaleFactor)
            contentScaleFactor = max(0, contentScaleFactor)
        }
    }
    
    /** Duration of the menu opening animation */
    open var menuAnimationDuration: TimeInterval = 0.4
    
    /** Animation options for menu open animation */
    open var menuAnimationOptions: UIViewAnimationOptions = .curveEaseOut
    
    /** If this property is set to true, whenever a menu is shown a transparent overlay view is added to the content view so there is no user interaction with the content. If the user touches the content, the menu will hide and the overlay will be removed. Defaults to true */
    open var hideMenuOnContentTap: Bool = true
    
    // MARK: Private properties
    
    private weak var animationDelegate: PGSideMenuAnimationDelegate?
    
    fileprivate var maxAbsoluteContentTranslation: CGFloat {
        return UIScreen.main.bounds.width * self.menuPercentWidth
    }
    
    /** The maximum angle (in degrees) the door menu can open */
    fileprivate let menuTilt: CGFloat = 45
    
    /** Content translation at the beggining of the pan gesture */
    fileprivate var initialContentTranslation: CGFloat = 0
    
    fileprivate var animating = false
    
    fileprivate var isLeftMenuShown: Bool {
        
        return self.contentViewCenterConstraint.constant == self.maxAbsoluteContentTranslation
        
    }
    
    fileprivate var isRightMenuShown: Bool {
        
        return self.contentViewCenterConstraint.constant == -self.maxAbsoluteContentTranslation
        
    }
    
    fileprivate lazy var contentOverlayView: UIView = {
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.clear
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(overlayTouched))
        overlayView.addGestureRecognizer(tapRecognizer)
        return overlayView
    }()
    
    // MARK: Initializers
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    public init(animationType: PGSideMenuAnimationType = .slideInRotate) {
        
        let podBundle = Bundle(for: PGSideMenu.self)
        let bundleURL = podBundle.url(forResource: "PGSideMenu", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        super.init(nibName: "PGSideMenu", bundle: bundle)
        let _ = self.view // used to set all outlets
        self.setAnimationDelegate(forAnimationType: animationType)
        
    }
    
    // MARK: Lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureController()
        self.addShadowToContentView()
        
    }
    
    // MARK: Public methods
    
    /** Sets the content controller */
    open func addContentController(_ controller: UIViewController) {
        
        self.addChildViewController(controller)
        self.contentContainerView.addSubviewFullscreen(controller.view)
        self.contentController = controller
        controller.didMove(toParentViewController: self)
        
    }
    
    /** Sets the left menu controller. You can retrieve this controller later using the leftMenuController property */
    open func addLeftMenuController(_ controller: UIViewController) {
        
        self.addChildViewController(controller)
        self.leftMenuContainerView.addSubviewFullscreen(controller.view)
        self.leftMenuController = controller
        controller.didMove(toParentViewController: self)
        
    }
    
    /** Sets the right menu controller. You can retrieve this controller later using the rightMenuController property */
    open func addRightMenuController(_ controller: UIViewController) {
        
        
        self.addChildViewController(controller)
        self.rightMenuContainerView.addSubviewFullscreen(controller.view)
        self.rightMenuController = controller
        controller.didMove(toParentViewController: self)
    }
    
    /** Open/close left menu depending on menu state. */
    open func toggleLeftMenu() {
        
        self.toggleMenu(.left)
        
    }
    
    /** Open/close right menu depending on menu state. */
    open func toggleRightMenu() {
        
        self.toggleMenu(.right)
    }
    
    /** Hides whatever menu is shown. */
    open func hideMenu(animated: Bool = true) {
        
        guard self.contentViewCenterConstraint.constant != 0 else {return}
        
        self.contentOverlayView.removeFromSuperview()
        
        self.contentViewCenterConstraint.constant = 0
        
        if animated {
            
            UIView.animate(withDuration: self.menuAnimationDuration, delay: 0, options: self.menuAnimationOptions, animations: {
                
                self.contentContainerView.layer.transform = CATransform3DIdentity
                self.view.layoutSubviews()
                
                }, completion: nil)
            
        } else {
            
            self.contentContainerView.layer.transform = CATransform3DIdentity
            self.view.layoutSubviews()
            
        }
        
    }
    
    // MARK: Private methods
    
    fileprivate func configureController(){
        
        self.leftMenuWidthConstraint.constant = self.maxAbsoluteContentTranslation
        self.rightMenuWidthConstraint.constant = self.maxAbsoluteContentTranslation
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    private func setAnimationDelegate(forAnimationType type: PGSideMenuAnimationType) {
        
        switch type {
            
        case .slideInRotate: self.animationDelegate = PGSideMenuSlideInRotateAnimator(sideMenu: self)
        default: break
            
        }
    }
    
    func overlayTouched(_ recognizer: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    fileprivate func addContentOverlay() {
        
        if self.contentOverlayView.superview == nil && self.hideMenuOnContentTap {
            self.contentController?.view.addSubviewFullscreen(self.contentOverlayView)
        }
    }
    
    func panGestureRecognized(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        
        switch recognizer.state {
            
        case .began:
            
            self.initialContentTranslation = self.contentViewCenterConstraint.constant
            
        case .changed:
            
            self.translateContentView(inXDimension: translation.x + self.initialContentTranslation)
            
        case .ended:
            
            self.handlePanGestureEnd()
            
        default:
            
            break
            
        }
        
    }
    
    /** The absolute translation to make on the content view */
    fileprivate func translateContentView(inXDimension x: CGFloat, animated: Bool = false) {

        // Do not translate if the translation is at the maximum
        guard abs(x) <= self.maxAbsoluteContentTranslation else {return}
        
        // Do not translate, if there is no menu
        if x > 0 && self.leftMenuController == nil {
            self.hideMenu(animated: false)
            return
        }
        
        if x < 0 && self.rightMenuController == nil {
            self.hideMenu(animated: false)
            return
        }
        
        // Add overlay
        self.addContentOverlay()
        
        let relativeTranslation = x / maxAbsoluteContentTranslation
        
        self.contentViewCenterConstraint.constant = x
        
        // 3d transforms
        
        let relative3dAngleTranslation: CGFloat = -(self.menuTilt * relativeTranslation)
        let contentContainerViewWidthAfterTranslation = self.contentContainerView.bounds.size.width * cos(Angle.degreesToRadians(degrees: relative3dAngleTranslation))
        var relative3dXTranslation: CGFloat =  self.contentContainerView.bounds.size.width - contentContainerViewWidthAfterTranslation
        relative3dXTranslation = x > 0 ? -relative3dXTranslation : relative3dXTranslation
        let relative3dScaleTranslation = 1 - (abs(relativeTranslation) * (1 - self.contentScaleFactor))
        
        var transform = CATransform3DIdentity;
        transform = CATransform3DScale(transform, 1, relative3dScaleTranslation, 1)
        transform.m34 = 1.0 / -1500;
        transform = CATransform3DRotate(transform, Angle.degreesToRadians(degrees: relative3dAngleTranslation), 0, 1, 0.0);
        transform = CATransform3DTranslate(transform, relative3dXTranslation, 0, 0)
        
        if animated {
            
            UIView.animate(withDuration: self.menuAnimationDuration, delay: 0, options: self.menuAnimationOptions, animations: {
                
                self.contentContainerView.layer.transform = transform;
                self.view.layoutSubviews()
                
                }, completion: nil)
            
        } else {
            
            self.contentContainerView.layer.transform = transform;
            
        }

    }
    
    fileprivate func handlePanGestureEnd() {
        
        if abs(self.contentViewCenterConstraint.constant) > self.maxAbsoluteContentTranslation / 2.0 {
            
            // Almost opened
            
            self.contentViewCenterConstraint.constant > 0 ? self.showMenu(.left) : self.showMenu(.right)
            
            
        } else {
            
            self.hideMenu()
            
        }
        
    }
    
    fileprivate func showMenu(_ side: Side) {
        
        let translation = side == .left ? self.maxAbsoluteContentTranslation : -self.maxAbsoluteContentTranslation
        
        self.translateContentView(inXDimension: translation, animated: true)
        
    }
    
    fileprivate func toggleMenu(_ side: Side) {
        
        if self.isLeftMenuShown || self.isRightMenuShown {
            
            self.hideMenu()
            
        } else {
            
            self.showMenu(side)
        }
        
    }
    
    // MARK: Appearance
    
    fileprivate func addShadowToContentView() {

        self.contentContainerView.layer.shadowColor = UIColor.black.cgColor
        self.contentContainerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.contentContainerView.layer.shadowOpacity = 0.8
        self.contentContainerView.layer.masksToBounds = false
        
    }
}
