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
        return lhs.rgb.red   == rhs.rgb.red   &&
               lhs.rgb.green == rhs.rgb.green &&
               lhs.rgb.blue  == rhs.rgb.blue  &&
               lhs.alpha == rhs.alpha
    }

    public static func luminance(of color: Color) -> Percent {
        func lum(of value: Float) -> Float {
            return value <= 0.03928 ? value / 12.92 : pow((value + 0.055) / 1.055, 2.4)
        }

        return (0.2126 * lum(of: color.rgb.red))   +
               (0.7152 * lum(of: color.rgb.green)) +
               (0.0722 * lum(of: color.rgb.blue))
    }

    public static func contrastRatio(of a: Color, and b: Color) -> Percent {
        let result = (luminance(of: a)) / (luminance(of: b))
        return result.isInfinite ? 1 : result
    }
}
