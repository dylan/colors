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
