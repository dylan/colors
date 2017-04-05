//
//  HSL.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/5/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

public struct HSL: Color {
    public var rgb:  RGB  { return toRGB()  }
    public var rgba: RGBA { return RGBA(self) }
    public var hsl:  HSL  { return self       }
    public var hsla: HSLA { return HSLA(self) }
    public var hsb:  HSB  { return HSB(self)  }
    public var hsba: HSBA { return HSBA(self) }

    #if os(iOS) || os(tvOS) || os(watchOS)
    public var osColor: UIColor { return UIColor() }
    #elseif os(macOS)
    public var osColor: NSColor { return NSColor() }
    #endif

    public var hue:        CGFloat = 0
    public var saturation: CGFloat = 0
    public var lightness:  CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsl
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ lightness: CGFloat) {
        self.hue = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturation = clamp(saturation, to: 1.0).cgFloat
        self.lightness  = clamp(lightness, to: 1.0).cgFloat
    }

    /// Converts an HSL value to an RGB one.
    /// From [W3.org](https://www.w3.org/TR/2011/REC-css3-color-20110607/#hsl-color)
    fileprivate func toRGB() -> RGB {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0

        if saturation == 0 {
            r = lightness
            g = lightness
            b = lightness
        } else {
            func hueToRgb(m1: CGFloat, m2: CGFloat, hue: CGFloat) -> CGFloat {
                var hue = hue
                if hue < 0 { hue += 1 }
                if hue > 1 { hue -= 1 }

                if hue < 1 / 6 { return m1 + (m2 - m1) * hue * 6 }
                if hue < 1 / 2 { return m2 }
                if hue < 2 / 3 { return m1 + (m2 - m1) * (2 / 3 - hue) * 6 }
                return m1
            }
            let m2: CGFloat = lightness < 0.5 ? lightness * (1 + saturation) : lightness + saturation - lightness * saturation
            let m1: CGFloat = 2 * lightness - m2

            r = hueToRgb(m1: m1, m2: m2, hue: hue + 1 / 3) * 255.0.cgFloat
            g = hueToRgb(m1: m1, m2: m2, hue: hue) * 255.cgFloat
            b = hueToRgb(m1: m1, m2: m2, hue: hue - 1 / 3) * 255.cgFloat
        }
        return RGB(r, g, b)
    }

    fileprivate func toHSLA() -> HSLA {
        return HSLA(self.hue, self.saturation, self.lightness, 1.0)
    }

}
