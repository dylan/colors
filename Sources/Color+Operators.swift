//
//  Color+Operators.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {
    public static func ==(lhs: Color, rhs: Color) -> Bool {
        return lhs.red   == rhs.red   &&
               lhs.green == rhs.green &&
               lhs.blue  == rhs.blue  &&
               lhs.alpha == rhs.alpha
    }
}
