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

    private var _redComponent: Float   = 0
    private var _greenComponent: Float = 0
    private var _blueComponent: Float  = 0
    private var _alphaComponent: Float = 1.0

    /// Represents the red component of this color in the RGB color model, values range from ```0``` to ```1.0```.
    ///
    public var red: Percent {
        get {
            return _redComponent
        }
        set {
            _redComponent = limitToPercentRange(newValue)
        }
    }

    /// Represents the green component of this color in the RGB color model, values range from ```0``` to ```1.0```.
    ///
    public var green: Percent {
        get {
            return _greenComponent
        }
        set {
            _greenComponent = limitToPercentRange(newValue)
        }
    }

    /// Represents the blue component of this color in the RGB color model, values range from ```0``` to ```1.0```.
    ///
    public var blue: Percent {
        get {
            return _blueComponent
        }
        set {
            _blueComponent = limitToPercentRange(newValue)
        }
    }

    /// Represents the alpha component of this color in the RGB color model, values range from ```0``` to ```1.0```.
    ///
    public var alpha: Percent {
        get {
            return _alphaComponent
        }
        set {
            _alphaComponent = limitToPercentRange(newValue)
        }
    }

    public var luminance: Percent {
        return Color.luminance(of: self)
    }

    mutating func set(from tuple: RGBTuple) {
        red   = tuple.red
        green = tuple.green
        blue  = tuple.blue
    }

    /// Initialize a `Color` using ```0``` to ```1.0``` values.
    ///
    public init(red: Percent, green: Percent, blue: Percent, alpha: Percent = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /// Initialize a `Color` using ```0``` to ```255``` 8-bit values.
    ///
    public init(redUInt: EightBitValue, greenUInt: EightBitValue, blueUInt: EightBitValue, alphaUInt: EightBitValue = 255) {
        self.init(red:   convert(from: redUInt),
                  green: convert(from: greenUInt),
                  blue:  convert(from: blueUInt),
                  alpha: convert(from: alphaUInt))
    }

    /// Initialize a `Color` using an RGB 24-bit hex value (or ```Int```).
    ///
    /// For example:
    ///
    ///     let red = Color(rgb: 0xff0000)
    ///
    public init(rgb: Hex) {
        self.init(
            redUInt:   EightBitValue((rgb >> 16) & 0xff),
            greenUInt: EightBitValue((rgb >> 8) & 0xff),
            blueUInt:  EightBitValue(rgb & 0xff)
        )
    }

    /// Initialize a `Color` using an ARGB 32-bit hex value (or ```Int```).
    ///
    /// For example:
    ///
    ///    let red = Color(rgb: 0xffff0000)
    ///
    public init(argb: Hex) {
        self.init(
            redUInt:    EightBitValue((argb >> 16) & 0xff),
            greenUInt:  EightBitValue((argb >> 8) & 0xff),
            blueUInt:   EightBitValue(argb & 0xff),
            alphaUInt:  EightBitValue((argb >> 24) & 0xff)
        )
    }
}
