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

public struct RGBA: Color, Alpha, CustomPlaygroundQuickLookable {

    public var rgb:  RGB  { return Colors.rgb(from: self)  }
    public var rgba: RGBA { return self }
    public var hsl:  HSL  { return Colors.hsl(from: self)  }
    public var hsla: HSLA { return Colors.hsla(from: self) }
    public var hsb:  HSB  { return Colors.hsb(from: self)  }
    public var hsba: HSBA { return Colors.hsba(from: self) }

    public var osColor: OSColor {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return UIColor(red: self.redComponent, green: self.greenComponent, blue: self.blueComponent, alpha: self.alphaComponent)
        #elseif os(macOS)
        return NSColor(red: self.redComponent, green: self.greenComponent, blue: self.blueComponent, alpha: self.alphaComponent)
        #endif
    }


    public var redComponent:   CGFloat = 0
    public var greenComponent: CGFloat = 0
    public var blueComponent:  CGFloat = 0
    public var alphaComponent: CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.rgba
        if let alphaColor = color as? Alpha {
            self.alphaComponent = alphaColor.alphaComponent
        }
    }

    public init(_ argbHex: Int) {
        self.init((argbHex >> 16) & 0xff, (argbHex >> 8) & 0xff, argbHex & 0xff, (argbHex >> 24) & 0xff)
    }

    public init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int) {
        self.redComponent   = clamp(red,   to: 255).cgFloat / 255.0
        self.greenComponent = clamp(green, to: 255).cgFloat / 255.0
        self.blueComponent  = clamp(blue,  to: 255).cgFloat / 255.0
        self.alphaComponent = clamp(alpha, to: 255).cgFloat / 255.0
    }

    public init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        self.redComponent   = clamp(red,   to: 1.0).cgFloat
        self.greenComponent = clamp(green, to: 1.0).cgFloat
        self.blueComponent  = clamp(blue,  to: 1.0).cgFloat
        self.alphaComponent = clamp(alpha, to: 1.0).cgFloat
    }

    public init(_ red: Double, _ green: Double, _ blue: Double, _ alpha: Double) {
        self.init(red, green, blue, alpha)
    }
    
    public var customPlaygroundQuickLook: PlaygroundQuickLook {
        #if os(iOS) || os(tvOS) || os(watchOS)
            return .color(self.osColor.uiColor)
        #elseif os(macOS)
            return .color(self.osColor.nsColor)
        #endif
    }
}
