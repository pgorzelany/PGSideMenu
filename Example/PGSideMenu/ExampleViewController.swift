//
//  ExampleViewController.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 27/05/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Properties
    
    // MARK: Initializers
    
    init() {
        
        super.init(nibName: "ExampleController", bundle: NSBundle.mainBundle())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Actions
    
    @IBAction func rightButtonTouched(sender: UIButton) {
        
        
        
    }
    
    @IBAction func leftButtonTouched(sender: UIButton) {
        
        
        
    }
    
    
    // MARK: Support
    
    // MARK: Data
    
    // MARK: Appearance

}
