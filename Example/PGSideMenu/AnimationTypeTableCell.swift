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

    // MARK: Configuration
    
    func configure(with animationType: PGSideMenuAnimationType, active: Bool) {
        self.titleLabel.text = animationType.description
        self.accessoryType = active ? .checkmark : .none
    }

}
