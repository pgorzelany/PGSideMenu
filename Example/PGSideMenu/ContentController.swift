//
//  ContentController.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 27/05/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PGSideMenu

class ContentController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    
    // MARK: Initializers
    
    init() {
        
        super.init(nibName: "ContentController", bundle: Bundle.main)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Actions
    
    @IBAction func rightButtonTouched(_ sender: UIButton) {
        
        if let sideMenuController = self.parent as? PGSideMenu {
            
            sideMenuController.toggleRightMenu()
            
        }
        
    }
    
    @IBAction func leftButtonTouched(_ sender: UIButton) {
        
        if let sideMenuController = self.parent as? PGSideMenu {
            
            sideMenuController.toggleLeftMenu()
            
        }
        
    }
    
    
    // MARK: Support
    
    // MARK: Data
    
    // MARK: Appearance

}
