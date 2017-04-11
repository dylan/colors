//
//  Color+HSL.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

func rgb(from hsl: HSLTuple) -> RGBTuple {
    var hue        = hsl.h
    var saturation = hsl.s
    var lightness  = hsl.l

    var m1: Float = 0.0
    var m2: Float = 0.0

    if lightness <= 0.5 {
        m2 = lightness * (saturation + 1)
    } else {
        m2 = lightness + saturation - lightness * saturation
    }

    m1 = lightness * 2 - m2

    func hueToRgb(m1: Float, m2: Float, hue: Float) -> Float {
        var hue = hue
        if hue < 0 { hue += 1 }
        if hue > 1 { hue -= 1 }

        if hue * 6 < 1 { return m1 + (m2 - m1) * hue * 6 }
        if hue * 2 < 1 { return m2 }
        if hue * 3 < 2 { return m1 + (m2 - m1) * (2 / 3 - hue) * 6 }
        return m1
    }
    let r = hueToRgb(m1: m1, m2: m2, hue: hue + 1 / 3)
    let g = hueToRgb(m1: m1, m2: m2, hue: hue)
    let b = hueToRgb(m1: m1, m2: m2, hue: hue - 1 / 3)
    return RGBTuple(r: r, g: g, b: b)
}

func hsl(from rgb: RGBTuple) -> HSLTuple {
    let red   = rgb.r
    let green = rgb.g
    let blue  = rgb.b

    let maxComponent = max(red, green, blue)
    let minComponent = min(red, green, blue)

    let halfRange = (maxComponent + minComponent) / 2
    let delta     = maxComponent - minComponent

    var hue        = halfRange
    var saturation = halfRange
    let lightness  = halfRange

    if maxComponent == minComponent {
        hue = 0
        saturation = 0
    } else {
        saturation = lightness > 0.5 ? delta / (2 - maxComponent - minComponent) : delta / (maxComponent + minComponent)

        if maxComponent == red {
            hue = (green - blue) / delta + (green < blue ? 6 : 0)
        }
        if maxComponent == green {
            hue = (blue - red) / delta + 2
        }
        if maxComponent == blue {
            hue = (red - green) / delta + 4
        }
        hue /= 6
    }

    return HSLTuple(h: hue, s: saturation, l: lightness)
}

extension Color {

    /// Returns a hue value in degrees ranging from ```0``` to ```360```.
    public var hue: Degree {
        get {
            return hsl(from: (r: red, g: green, b: blue)).h * 360
        }
        set {
            let value = limitToDegreeRange(newValue)
            set(from: rgb(from: (h: value / 360, s: saturation, l: lightness)))
        }
    }

    /// Returns a saturation percentage value ranging from ```0``` to ```1.0```.
    public var saturation: Percent {
        get {
            return hsl(from: (r: red, g: green, b: blue)).s
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (h: hue / 360, s: value, l: lightness)))
        }
    }

    /// Returns a lightness percentage value ranging from ```0``` to ```1.0```.
    public var lightness: Percent {
        get {
            return hsl(from: (r: red, g: green, b: blue)).l
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (h: hue / 360, s: saturation, l: value)))
        }
    }

    fileprivate mutating func set(from tuple: RGBTuple) {
        red   = tuple.r
        green = tuple.g
        blue  = tuple.b
    }
}
