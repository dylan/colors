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

public struct HSL: Color, CustomPlaygroundQuickLookable {
    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return self }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red:   rgba.redComponent,
                       green: rgba.greenComponent,
                       blue:  rgba.blueComponent,
                       alpha: 1.0)
        #elseif os(macOS)
        return NSColor(red:   rgba.redComponent,
                       green: rgba.greenComponent,
                       blue:  rgba.blueComponent,
                       alpha: 1.0)
        #endif
    }

    public var hueComponent:        CGFloat = 0
    public var saturationComponent: CGFloat = 0
    public var lightnessComponent:  CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsl
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ lightness: CGFloat) {
        self.hueComponent = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturationComponent = clamp(saturation, to: 1.0).cgFloat
        self.lightnessComponent  = clamp(lightness,  to: 1.0).cgFloat
    }
    
    public var customPlaygroundQuickLook: PlaygroundQuickLook {
        #if os(iOS) || os(tvOS) || os(watchOS)
            return .color(self.osColor.uiColor)
        #elseif os(macOS)
            return .color(self.osColor.nsColor)
        #endif
    }

}
