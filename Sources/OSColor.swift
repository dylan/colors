//
//  OSColor.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/6/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

public protocol OSColor {
    var redComponent: CGFloat { get }
    var blueComponent: CGFloat { get }
    var greenComponent: CGFloat { get }
    var alphaComponent: CGFloat { get }

    var hueComponent: CGFloat { get }
    var saturationComponent: CGFloat { get }
    var brightnessComponent: CGFloat { get }

    func setFill()
    func setStroke()
    var cgColor: CGColor { get }
    #if os(iOS) || os(tvOS) || os(watchOS)
    var uiColor: UIColor { get }
    #elseif os(macOS)
    var nsColor: NSColor { get }
    #endif
}

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit

    extension UIColor: OSColor {
        public var brightnessComponent: CGFloat {
            var result = HSBATupleBlack
            self.getHue(nil, saturation: nil, brightness: &result.b, alpha: nil)
            return result.b
        }

        public var saturationComponent: CGFloat {
            var result = HSBATupleBlack
            self.getHue(nil, saturation: &result.s, brightness: nil, alpha: nil)
            return result.s
        }

        public var hueComponent: CGFloat {
            var result = HSBATupleBlack
            self.getHue(&result.h, saturation: nil, brightness: nil, alpha: nil)
            return result.h
        }

        public var alphaComponent: CGFloat {
            var result = RGBATupleBlack
            self.getRed(nil, green: nil, blue: nil, alpha: &result.a)
            return result.a
        }

        public var greenComponent: CGFloat {
            var result = RGBATupleBlack
            self.getRed(nil, green: &result.g, blue: nil, alpha: nil)
            return result.g
        }

        public var blueComponent: CGFloat {
            var result = RGBATupleBlack
            self.getRed(nil, green: nil, blue: &result.b, alpha: nil)
            return result.b
        }

        public var redComponent: CGFloat {
            var result = RGBATupleBlack
            self.getRed(&result.r, green: nil, blue: nil, alpha: nil)
            return result.r
        }

        public var uiColor: UIColor {
            return self
        }
    }
#elseif os(macOS)
    import AppKit

    extension NSColor: OSColor {
        public var nsColor: NSColor {
            return self
        }
    }
#endif
