//
//  PGSideMenuAnimationType.swift
//  Pods
//
//  Created by Piotr Gorzelany on 11/09/16.
//
//

import Foundation

public enum PGSideMenuAnimationType: Int {

    case slideIn = 0
    case slideOver = 1
    case slideInRotate = 2
    
}

extension PGSideMenuAnimationType {
    
    public static var values: [PGSideMenuAnimationType] {
        return (0...10).compactMap(PGSideMenuAnimationType.init)
    }
}

extension PGSideMenuAnimationType: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
            
        case .slideOver: return "Slide Over"
        case .slideInRotate: return "Slide In Rotate"
        case .slideIn: return "Slide In"
        }
    }
}


