//
//  Array+Color.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension Array where Element == Color {

    #if os(iOS) || os(tvOS) || os(watchOS)
    public func uiColors() -> [UIColor] {
        return self.map({ $0.UIColor })
    }
    #elseif os(macOS)
    public func nsColors() -> [NSColor] {
        return self.map({ $0.NSColor })
    }
    #endif

    #if os(iOS) || os(macOS)
    public var view: ColorView {
        return ColorView(colors: self)
    }
    #endif

    public func spread(to size: Int, using interpolation: Color.Interpolation = .hue) -> [Element] {
        return Element.spread(colors: self, to: size, using: interpolation)
    }
}
