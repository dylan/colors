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
        return UIColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: 1.0)
        #elseif os(macOS)
        return NSColor(red: redComponent, green: greenComponent, blue: blueComponent, alpha: 1.0)
        #endif
    }

    public var redComponent:   CGFloat = 0
    public var greenComponent: CGFloat = 0
    public var blueComponent:  CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.rgb
    }

    public init(_ rgbHex: Int) {
        self.init((rgbHex >> 16) & 0xff, (rgbHex >> 8) & 0xff, rgbHex & 0xff)
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.redComponent   = clamp(red, to: 255).cgFloat   / 255.0
        self.greenComponent = clamp(green, to: 255).cgFloat / 255.0
        self.blueComponent  = clamp(blue, to: 255).cgFloat  / 255.0
    }

    public init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.redComponent   = clamp(red,   to: 1.0).cgFloat
        self.greenComponent = clamp(green, to: 1.0).cgFloat
        self.blueComponent  = clamp(blue,  to: 1.0).cgFloat
    }

    fileprivate func toHSL() -> HSL {
        let maxComponent = max(redComponent, blueComponent, greenComponent)
        let minComponent = min(redComponent, blueComponent, greenComponent)
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

            if maxComponent == redComponent {
                hue = (greenComponent - blueComponent) / delta + (greenComponent < blueComponent ? 6 : 0)
            }
            if maxComponent == greenComponent {
                hue = (blueComponent - redComponent) / delta + 2
            }
            if maxComponent == blueComponent {
                hue = (redComponent - greenComponent) / delta + 4
            }
            hue /= 6
        }
        return HSL(hue * 360, saturation, lightness)
    }

    fileprivate func toRGBA() -> RGBA {
        return RGBA(self.redComponent, self.greenComponent, self.blueComponent, 1.0)
    }

    fileprivate func toHSBA() -> HSBA {
        var result = HSBA(0,
                          osColor.saturationComponent,
                          osColor.brightnessComponent,
                          osColor.alphaComponent)
        result.hueComponent = osColor.hueComponent
        return result
    }
}
