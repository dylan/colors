//
//  RGB.swift
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

public struct RGB: Color {

    public var rgb:  RGB  { return self  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        #elseif os(macOS)
        return NSColor(red: red, green: green, blue: blue, alpha: 1.0)
        #endif
    }

    public var red:   CGFloat = 0
    public var green: CGFloat = 0
    public var blue:  CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.rgb
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.red   = clamp(red, to: 255).cgFloat   / 255.0
        self.green = clamp(green, to: 255).cgFloat / 255.0
        self.blue  = clamp(blue, to: 255).cgFloat  / 255.0
    }

    public init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.red   = clamp(red,   to: 1.0).cgFloat
        self.green = clamp(green, to: 1.0).cgFloat
        self.blue  = clamp(blue,  to: 1.0).cgFloat
    }

    fileprivate func toHSL() -> HSL {
        let maxComponent = max(red, blue, green)
        let minComponent = min(red, blue, green)
        let halfRange    = (maxComponent + minComponent) / 2
        let delta        = maxComponent - minComponent

        var hue         = halfRange
        var saturation  = halfRange
        let lightness   = halfRange

        if maxComponent == minComponent {
            hue = 0
            saturation = 0
        } else {
            saturation = lightness > 0.5 ? delta / (2 - maxComponent - minComponent) : delta / (maxComponent + minComponent)

            if maxComponent == red {
                hue = (green - blue) / delta + (green < blue ? 6 : 0)
            }
            if maxComponent == green {
                hue = (blue - red) / delta + 2
            }
            if maxComponent == blue {
                hue = (red - green) / delta + 4
            }
            hue /= 6
        }
        return HSL(hue * 360, saturation, lightness)
    }

    fileprivate func toRGBA() -> RGBA {
        return RGBA(self.red, self.green, self.blue, 1.0)
    }

    fileprivate func toHSBA() -> HSBA {
        var result = HSBA(0,
                          osColor.saturationComponent,
                          osColor.brightnessComponent,
                          osColor.alphaComponent)
        result.hue = osColor.hueComponent
        return result
    }
}
