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

    public static func luminance(of color: Color) -> Percent {
        func lum(of value: Float) -> Float {
            return value <= 0.03928 ? value / 12.92 : pow((value + 0.055) / 1.055, 2.4)
        }

        return (0.2126 * lum(of: color.red))   +
               (0.7152 * lum(of: color.green)) +
               (0.0722 * lum(of: color.blue))
    }
}
