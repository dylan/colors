//
//  FloatingPoint+Units.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 5/9/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Float {
    var degrees: Float {
        return limitToDegreeRange(self)
    }

    var percent: Float {
        return limitToPercentRange(self)
    }


}
