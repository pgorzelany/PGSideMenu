//
//  Angle.swift
//  SwiftDemos
//
//  Created by Piotr Gorzelany on 26/05/16.
//  Copyright © 2016 Piotr Gorzelany. All rights reserved.
//

import Foundation
import UIKit

final class Angle {
    
    static func radiansToDegrees(radians: CGFloat) -> CGFloat {
        
        return radians * CGFloat(180) / CGFloat(M_PI)
        
    }
    
    static func degreesToRadians(degrees: CGFloat) -> CGFloat {
        
        return degrees * CGFloat(M_PI) / CGFloat(180)
        
    }
    
}
