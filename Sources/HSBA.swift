//
//  HSBA.swift
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

public struct HSBA: Color, Alpha {
    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return Colors.rgba(from: self) }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return self }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(hue:        self.hueComponent,
                       saturation: self.saturationComponent,
                       brightness: self.brightnessComponent,
                       alpha:      self.alphaComponent)
        #elseif os(macOS)
            return NSColor(hue:        self.hueComponent,
                           saturation: self.saturationComponent,
                           brightness: self.brightnessComponent,
                           alpha:      self.alphaComponent)
        #endif
    }

    public var hueComponent:        CGFloat = 0
    public var saturationComponent: CGFloat = 0
    public var brightnessComponent: CGFloat = 0
    public var alphaComponent:      CGFloat = 0

    public init() {}

    public init(_ color: Color) {
        self = color.hsba
        if let alphaColor = color as? Alpha {
            self.alphaComponent = alphaColor.alphaComponent
        }
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ brightness: CGFloat, _ alpha: CGFloat) {
        self.hueComponent        = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturationComponent = clamp(saturation, to: 1.0).cgFloat
        self.brightnessComponent = clamp(brightness, to: 1.0).cgFloat
        self.alphaComponent      = clamp(alpha, to: 1.0).cgFloat
    }
}
