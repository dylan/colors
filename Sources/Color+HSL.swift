//
//  Color+HSL.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

func rgb(from hsl: HSLTuple) -> RGBTuple {
    var hue        = hsl.hue
    var saturation = hsl.saturation
    var lightness  = hsl.lightness

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

    return RGBTuple(red: r, green: g, blue: b)
}

func hsl(from rgb: RGBTuple) -> HSLTuple {
    let red   = rgb.red
    let green = rgb.green
    let blue  = rgb.blue

    let maxComponent = max(red, green, blue)
    let minComponent = min(red, green, blue)

    let halfRange = (maxComponent + minComponent) / 2
    let delta     = maxComponent - minComponent

    var hue        = halfRange
    var saturation = halfRange
    let lightness  = halfRange

    if maxComponent != minComponent {
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


    return HSLTuple(hue: hue, saturation: saturation, lightness: lightness)
}

extension Color {

    /// Returns a hue value in degrees ranging from ```0``` to ```360```.
    public var hue: Degree {
        get {
            return hsl(from: (red: red, green: green, blue: blue)).hue * 360
        }
        set {
            let value = limitToDegreeRange(newValue)
            set(from: rgb(from: (hue: value / 360, saturation: hslSaturation, lightness: hslLightness)))
        }
    }

    /// Returns a saturation percentage value ranging from ```0``` to ```1.0```.
    public var hslSaturation: Percent {
        get {
            return hsl(from: (red: red, green: green, blue: blue)).saturation
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (hue: hue / 360, saturation: value, lightness: hslLightness)))
        }
    }

    /// Returns a lightness percentage value ranging from ```0``` to ```1.0```.
    public var hslLightness: Percent {
        get {
            return hsl(from: (red: red, green: green, blue: blue)).lightness
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (hue: hue / 360, saturation: hslSaturation, lightness: value)))
        }
    }
}
