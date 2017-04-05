//
//  Colors.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on {TODAY}.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

public protocol Color {
    var rgb:  RGB  { get }
    var rgba: RGBA { get }
    var hsl:  HSL  { get }
    var hsla: HSLA { get }
    var hsb:  HSB  { get }
    var hsba: HSBA { get }

    #if os(iOS) || os(tvOS) || os(watchOS)
    var osColor: UIColor { get }
    #elseif os(macOS)
    var osColor: NSColor { get }
    #endif

    init(_ color: Color)
}
