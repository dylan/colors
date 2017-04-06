//
//  HSLA.swift
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

public struct HSLA: Color, Alpha {
    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return self }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red: rgba.red,
                       green: rgba.green,
                       blue: rgba.blue,
                       alpha: self.alpha)
        #elseif os(macOS)
        return NSColor(red: rgba.red,
                       green: rgba.green,
                       blue: rgba.blue,
                       alpha: self.alpha)
        #endif
    }


    public var hue:        CGFloat = 0
    public var saturation: CGFloat = 0
    public var lightness:  CGFloat = 0
    public var alpha:      CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsla
        if let alphaColor = color as? Alpha {
            self.alpha = alphaColor.alpha
        }
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ lightness: CGFloat, _ alpha: CGFloat) {
        self.hue        = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturation = clamp(saturation, to: 1.0).cgFloat
        self.lightness  = clamp(lightness, to: 1.0).cgFloat
        self.alpha      = clamp(alpha, to: 1.0).cgFloat
    }
}
