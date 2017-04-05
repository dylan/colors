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

public struct HSLA: Color {
    public var rgb:  RGB  { return RGB(self)  }
    public var rgba: RGBA { return RGBA(self) }
    public var hsl:  HSL  { return HSL(self)  }
    public var hsla: HSLA { return self       }
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
    public var alpha:      CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsla
    }

    public init(_ hue: CGFloat, _ saturation: CGFloat, _ lightness: CGFloat, _ alpha: CGFloat) {
        self.hue        = hue.truncatingRemainder(dividingBy: 360) / 360
        self.saturation = clamp(saturation, to: 1.0).cgFloat
        self.lightness  = clamp(lightness, to: 1.0).cgFloat
        self.alpha      = clamp(alpha, to: 1.0).cgFloat
    }
}
