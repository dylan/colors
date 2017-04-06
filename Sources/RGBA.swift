//
//  RGBA.swift
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

public struct RGBA: Color, Alpha {

    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return self }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        #elseif os(macOS)
        return NSColor(red: red, green: green, blue: blue, alpha: alpha)
        #endif
    }


    public var red:   CGFloat = 0
    public var green: CGFloat = 0
    public var blue:  CGFloat = 0
    public var alpha: CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.rgba
        if let alphaColor = color as? Alpha {
            self.alpha = alphaColor.alpha
        }
    }

    public init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int) {
        self.red   = clamp(red, to: 255).cgFloat   / 255.0
        self.green = clamp(green, to: 255).cgFloat / 255.0
        self.blue  = clamp(blue, to: 255).cgFloat  / 255.0
        self.alpha = clamp(alpha, to: 255).cgFloat / 255.0
    }

    public init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        self.red   = clamp(red,   to: 1.0).cgFloat
        self.green = clamp(green, to: 1.0).cgFloat
        self.blue  = clamp(blue,  to: 1.0).cgFloat
        self.alpha = clamp(alpha,  to: 1.0).cgFloat
    }

    public init(_ red: Double, _ green: Double, _ blue: Double, _ alpha: Double) {
        self.init(red, green, blue, alpha)
    }

    fileprivate func toRGB() -> RGB {
        return RGB(self.red, self.blue, self.green)
    }
}
