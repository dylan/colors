//
//  Colors.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on {TODAY}.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct Color {

    public var red:   NumericValue
    public var green: NumericValue
    public var blue:  NumericValue
    public var alpha: NumericValue

    public var hsbaValues: HSBATuple {
        var result = HSBATupleBlack
        osColor.getHue(&result.h, saturation: &result.s, brightness: &result.b, alpha: &result.a)
        return result
    }

    public var rgbaValues: RGBATuple {
        var result = RGBATupleBlack
        osColor.getRed(&result.r, green: &result.g, blue: &result.b, alpha: &result.a)
        return result
    }

    public init(red: Int, green: Int, blue: Int, alpha: Int) {
        self.red   = clamp(red,   to: 255) / 255.0
        self.green = clamp(green, to: 255) / 255.0
        self.blue  = clamp(blue,  to: 255) / 255.0
        self.alpha = clamp(alpha, to: 255) / 255.0
    }

    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red   = clamp(red, to: 1.0)
        self.green = clamp(green, to: 1.0)
        self.blue  = clamp(blue, to: 1.0)
        self.alpha = clamp(alpha, to: 1.0)
    }

    public init(hue: Int, saturation: Double, lightness: Double, alpha: Double) {
        let rgb = Color.hslToRGB(hue: hue, saturation: saturation, lightness: lightness)
        self.red   = rgb.r
        self.green = rgb.g
        self.blue  = rgb.b
        self.alpha = alpha
    }

    public init(hue: Double, saturation: Double, brightness: Double, alpha: Double) {
        #if os(iOS) || os(tvOS) || os(watchOS)
        let newOSColor = UIColor(hue: hue.cgFloat,
                                 saturation: saturation.cgFloat,
                                 brightness: brightness.cgFloat,
                                 alpha: alpha.cgFloat)
        #elseif os(macOS)
        let newOSColor = NSColor(hue: hue.cgFloat,
                                 saturation: saturation.cgFloat,
                                 brightness: brightness.cgFloat,
                                 alpha: alpha.cgFloat)
        #endif
        var result = RGBATupleBlack
        newOSColor.getRed(&result.r, green: &result.g, blue: &result.b, alpha: &result.a)

        self.red   = result.r
        self.green = result.g
        self.blue  = result.b
        self.alpha = result.a
    }

    /// From https://www.w3.org/TR/2011/REC-css3-color-20110607/#hsl-color
    fileprivate static func hslToRGB(hue: Int, saturation: Double, lightness: Double) -> (r: Double, g: Double, b: Double) {

        var hue = Double(mod(hue, to: 360) / 360.0)

        var m1 = 0.0
        var m2 = 0.0

        if lightness <= 0.5 {
            m2 = lightness * (saturation + 1)
        } else {
            m2 = lightness + saturation - lightness * saturation
        }

        m1 = lightness * 2 - m2

        func hueToRgb(m1: Double, m2: Double, hue: Double) -> Double {
            var hue = hue
            if hue < 0 { hue += 1 }
            if hue > 1 { hue -= 1 }

            if hue * 6 < 1 { return m1 + (m2 - m1) * hue * 6 }
            if hue * 2 < 1 { return m2 }
            if hue * 3 < 2 { return m1 + (m2 - m1) * (2 / 3 - hue) * 6 }
            return m1
        }

        return (r: hueToRgb(m1: m1, m2: m2, hue: hue + 1 / 3),
                g: hueToRgb(m1: m1, m2: m2, hue: hue),
                b: hueToRgb(m1: m1, m2: m2, hue: hue - 1 / 3))
    }
}
