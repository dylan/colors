//
//  HSB.swift
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

public struct HSB: Color {
    public var rgb:  RGB  { return RGB(self)  }
    public var rgba: RGBA { return RGBA(self) }
    public var hsl:  HSL  { return HSL(self)  }
    public var hsla: HSLA { return HSLA(self) }
    public var hsb:  HSB  { return self       }
    public var hsba: HSBA { return HSBA(self) }

    #if os(iOS) || os(tvOS) || os(watchOS)
    public var osColor: UIColor { return UIColor() }
    #elseif os(macOS)
    public var osColor: NSColor { return NSColor() }
    #endif

    public var hue:        CGFloat = 0
    public var saturation: CGFloat = 0
    public var brightness: CGFloat = 0

    public init() {}
    
    public init(_ color: Color) {
        self = color.hsb
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
    }
}
