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

public struct HSLA: Color, Alpha, CustomPlaygroundQuickLookable {
    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return self }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red:   rgba.redComponent,
                       green: rgba.greenComponent,
                       blue:  rgba.blueComponent,
                       alpha: self.alphaComponent)
        #elseif os(macOS)
        return NSColor(red:   rgba.redComponent,
                       green: rgba.greenComponent,
                       blue:  rgba.blueComponent,
                       alpha: self.alphaComponent)
        #endif
    }


    public var hueComponent:        CGFloat = 0
    public var saturationComponent: CGFloat = 0
    public var lightnessComponent:  CGFloat = 0
    public var alphaComponent:      CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsla
        if let alphaColor = color as? Alpha {
            self.alphaComponent = alphaColor.alphaComponent
        }
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ lightness: CGFloat, _ alpha: CGFloat) {
        self.hueComponent        = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturationComponent = clamp(saturation, to: 1.0).cgFloat
        self.lightnessComponent  = clamp(lightness, to: 1.0).cgFloat
        self.alphaComponent      = clamp(alpha, to: 1.0).cgFloat
    }
    public var customPlaygroundQuickLook: PlaygroundQuickLook {
        #if os(iOS) || os(tvOS) || os(watchOS)
            return .color(self.osColor.uiColor)
        #elseif os(macOS)
            return .color(self.osColor.nsColor)
        #endif
    }

}
