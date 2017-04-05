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
    public var rgb:  RGB  { return self       }
    public var rgba: RGBA { return RGBA(self) }
    public var hsl:  HSL  { return HSL(self)  }
    public var hsla: HSLA { return HSLA(self) }
    public var hsb:  HSB  { return HSB(self)  }
    public var hsba: HSBA { return HSBA(self) }

    #if os(iOS) || os(tvOS) || os(watchOS)
    public var osColor: UIColor { return UIColor() }
    #elseif os(macOS)
    public var osColor: NSColor { return NSColor() }
    #endif

    public var red:   CGFloat = 0
    public var green: CGFloat = 0
    public var blue:  CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        let color  = color.rgb
        self.red   = color.red
        self.green = color.green
        self.blue  = color.blue
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.red   = CGFloat(clamp(red, to: 255))   / 255.0
        self.green = CGFloat(clamp(green, to: 255)) / 255.0
        self.blue  = CGFloat(clamp(blue, to: 255))  / 255.0
    }
}
