//
//  LeftMenuController.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 27/05/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class LeftMenuController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    
    // MARK: Initializers
    
    init() {
        
        super.init(nibName: "LeftMenuController", bundle: NSBundle.mainBundle())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }    
    
    // MARK: Support
    
    // MARK: Data
    
    // MARK: Appearance


}
