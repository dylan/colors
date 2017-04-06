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
    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return self }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    #if os(iOS) || os(tvOS) || os(watchOS)
    public var osColor: UIColor {
        return UIColor(red: self.rgba.red, green: self.rgba.green, blue: self.rgba.blue, alpha: 1.0)
    }
    #elseif os(macOS)
    public var osColor: NSColor {
        return NSColor(red: self.rgba.red, green: self.rgba.green, blue: self.rgba.blue, alpha: 1.0)
    }
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
}
