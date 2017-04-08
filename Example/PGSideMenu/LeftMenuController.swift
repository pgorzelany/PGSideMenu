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

    // MARK: Initializers
    
    init() {
        super.init(nibName: "LeftMenuController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
