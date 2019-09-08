//
//  UIView+PGSideMenu.swift
//  Pods
//
//  Created by Piotr Gorzelany on 27/05/16.
//
//

import UIKit

extension UIView {
    
    func addSubviewFullscreen(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["subview": subview]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[subview]-(0)-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["subview": subview]))
        
    }
    
}
