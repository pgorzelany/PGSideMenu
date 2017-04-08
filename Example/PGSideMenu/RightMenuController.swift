//
//  RightMenuController.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 27/05/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class RightMenuController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!

    // MARK: Initializers
    
    init() {
        super.init(nibName: "RightMenuController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
