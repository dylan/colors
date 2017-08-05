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

/// Represents a 24-bit color with an 8-bit alpha value.
///
public struct Color {
    var components: ColorComponents
    public var alpha: Float
    public var space: ColorSpace

    public var luminance: Percent {
        return Color.luminance(of: self)
    }


    /// Initialize a `Color` using ```0``` to ```1.0``` `ColorComponents` values.
    ///
    public init(_ components: ColorComponents, space: ColorSpace) {
        guard space.componentCount == components.count else {
            fatalError("Incorrect number of components passed for Color. Should be \(space.componentCount)")
        }
        self.components = components

        self.space = space
        self.alpha = 1
    }

    /// Initialize a `Color` in the RGB `ColorSpace` using ```0``` to ```1.0``` values.
    ///
    public init(red: Float, green: Float, blue: Float) {
        self = Color([red, green, blue], space: .rgb)
    }

    /// Initialize a `Color` in the RGB `ColorSpace` using ```0``` to ```1.0``` values.
    ///
    public init(red: Float, green: Float, blue: Float, alpha: Float) {
        self = Color([red, green, blue], space: .rgb)
        self.alpha = alpha
    }

    /// Initialize a `Color` in the RGB `ColorSpace` using ```0``` to ```255``` `Int` values.
    ///
    public init(redInt: Int, greenInt: Int, blueInt: Int) {
        self = Color(red: Float(redInt) / 255, green: Float(greenInt) / 255, blue: Float(blueInt) / 255)
    }

    /// Initialize a `Color` in the HSL `ColorSpace` using ```0``` to ```1.0``` values.
    ///
    public init(hue: Float, saturation: Float, luminosity: Float) {
        self = Color([hue, saturation, luminosity], space: .hsl)
    }

    /// Initialize a `Color` in the HSV `ColorSpace` using ```0``` to ```1.0``` values.
    ///
    public init(hue: Float, saturation: Float, value: Float) {
        self = Color([hue, saturation, value], space: .hsv)
    }

    /// Initialize a `Color` in the CMYK `ColorSpace` using ```0``` to ```1.0``` values.
    ///
    public init(cyan: Float, magenta: Float, yellow: Float, key: Float) {
        self = Color([cyan, magenta, yellow, key], space: .cmyk)
    }

    public init(x: Float, y: Float, z: Float) {
        self = Color([x, y, z], space: .xyz)
    }

    public init(l: Float, a: Float, b: Float) {
        self = Color([l, a, b], space: .lab)
    }

    /// Initialize a `Color` using an RGB 24-bit hex (`Int`) value.
    ///
    /// For example:
    ///
    ///     let red = Color(hex: 0xff0000)
    ///
    public init(hex: Int) {
        self = Color.hex2rgb(hex)
    }

    /// Initialize a `Color` using an RGB 24-bit hex `String` value.
    ///
    /// For example:
    ///
    ///     let red = Color(hex: "0xff0000")
    ///
    public init(hex: String) {
        self = Color.hexString2rgb(hex)
    }

    init(_ components: RGBComponents) {
        self = Color([components.red, components.green, components.blue], space: .rgb)
    }

    init(_ components: XYZComponents) {
        self = Color([components.x, components.y, components.z], space: .xyz)
    }

    init(_ components: LABComponents) {
        self = Color([components.l, components.a, components.b], space: .lab)
    }

    init(_ components: HSLComponents) {
        self = Color([components.hue, components.saturation, components.luminosity], space: .hsl)
    }

    init(_ components: HSVComponents) {
        self = Color([components.hue, components.saturation, components.value], space: .hsv)
    }

    init(_ components: CMYKComponents) {
        self = Color([components.cyan, components.magenta, components.yellow, components.key], space: .cmyk)
    }
}
