    //
//  DoorMenuViewController.swift
//  SwiftDemos
//
//  Created by Piotr Gorzelany on 22/05/16.
//  Copyright © 2016 Piotr Gorzelany. All rights reserved.
//

import UIKit

open class PGSideMenu: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var leftMenuContainerView: UIView!
    @IBOutlet weak var rightMenuContainerView: UIView!
    
    @IBOutlet weak var contentViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMenuWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightMenuWidthConstraint: NSLayoutConstraint!
    
    // MARK: Public Properties
    
    /** The current content controller */
    public var contentController: UIViewController?
    
    /** Left menu controller */
    public var leftMenuController: UIViewController?
    
    /** Right menu controller */
    public var rightMenuController: UIViewController?
    
    /** Sets the animation type of the menu. Closes any currently opened menu. */
    public var animationType: PGSideMenuAnimationType = .slideIn {
        didSet {
            self.animationDelegate.hideMenu(animated: false)
            self.setAnimationDelegate(forAnimationType: self.animationType)
        }
    }
    
    /** The width of the menu container as a percentage of the screen. Min is 0,  max is 1. */
    public var menuPercentWidth: CGFloat = 0.8 {
        didSet {
            menuPercentWidth = min(1, menuPercentWidth)
            menuPercentWidth = max(0, menuPercentWidth)
        }
    }
    
    /** The scale factor for the content view when menu is shown. Min is 0, max is 1. */
    public var contentScaleFactor: CGFloat = 0.9 {
        didSet {
            contentScaleFactor = min(1, contentScaleFactor)
            contentScaleFactor = max(0, contentScaleFactor)
        }
    }
    
    /** Duration of the menu opening animation */
    public var menuAnimationDuration: TimeInterval = 0.4
    
    /** Animation options for menu open animation */
    public var menuAnimationOptions: UIViewAnimationOptions = .curveEaseOut
    
    /** If this property is set to true, whenever a menu is shown a transparent overlay view is added to the content view so there is no user interaction with the content. If the user touches the content, the menu will hide and the overlay will be removed. Defaults to true */
    public var hideMenuOnContentTap: Bool = true
    
    // MARK: Private properties
    
    private lazy var animationDelegate: PGSideMenuAnimationDelegate = {
        return PGSideMenuSlideInRotateAnimator(sideMenu: self)
    }()
    
    lazy var contentOverlayView: UIView = {
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
    
    public init(animationType: PGSideMenuAnimationType) {
        
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
        
        self.animationDelegate.toggleLeftMenu(animated: true)
        
    }
    
    /** Open/close right menu depending on menu state. */
    open func toggleRightMenu() {
        
        self.self.animationDelegate.toggleRightMenu(animated: true)
    }
    
    /** Hides whatever menu is shown. */
    open func hideMenu(animated: Bool = true) {
        
        self.animationDelegate.hideMenu(animated: animated)
    }
    
    // MARK: Private methods
    
    fileprivate func configureController(){
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    private func setAnimationDelegate(forAnimationType type: PGSideMenuAnimationType) {
        
        switch type {
            
        case .slideInRotate: self.animationDelegate = PGSideMenuSlideInRotateAnimator(sideMenu: self)
            
        case .slideIn: self.animationDelegate = PGSideMenuSlideInAnimator(sideMenu: self)
            
        case .slideOver: self.animationDelegate = PGSideMenuSlideOverAnimator(sideMenu: self)
            
        }
    }
    
    func overlayTouched(_ recognizer: UITapGestureRecognizer) {
        self.animationDelegate.hideMenu(animated: true)
    }
    
    func addContentOverlay() {
        
        if self.contentOverlayView.superview == nil && self.hideMenuOnContentTap {
            self.contentController?.view.addSubviewFullscreen(self.contentOverlayView)
        }
    }
    
    func panGestureRecognized(_ recognizer: UIPanGestureRecognizer) {
        
        self.animationDelegate.sideMenu(panGestureRecognized: recognizer)
        
    }
}
