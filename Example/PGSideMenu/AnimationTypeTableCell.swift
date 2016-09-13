//
//  AnimationTypeTableCell.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PGSideMenu

class AnimationTypeTableCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    // MARK: Configuration
    
    func configure(with animationType: PGSideMenuAnimationType) {
        
        self.titleLabel.text = animationType.description
    }

}
