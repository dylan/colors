//
//  Color+HSB.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

func hsb(from rgb: RGBTuple) -> HSBTuple {
    let red   = rgb.red
    let green = rgb.green
    let blue  = rgb.blue

    let maxComponent = max(red, green, blue)
    let minComponent = min(red, green, blue)

    let delta     = maxComponent - minComponent

    var hue        = maxComponent
    let saturation = maxComponent == 0 ? 0 : delta / maxComponent
    let brightness = maxComponent

    if maxComponent != minComponent {
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

    return HSBTuple(hue: hue, saturation: saturation, brightness: brightness)
}

func rgb(from hsb: HSBTuple) -> RGBTuple {
    let hue = hsb.hue
    let saturation = hsb.saturation
    let brightness = hsb.brightness

    let i = floor(hue)
    let f = hue - i
    let p = brightness * (1 - saturation)
    let q = brightness * (1 - f * saturation)
    let t = brightness * (1 - (1 - f) * saturation)
    var mod = Int(i.remainder(dividingBy: 6))

    mod = mod >= 0 ? mod : 0

    // Table lookup
    let red =   [brightness, q, p, p, t, brightness][mod]
    let green = [t, brightness, brightness, q, p, p][mod]
    let blue =  [p, p, t, brightness, brightness, q][mod]

    return RGBTuple(red: red, green: green, blue: blue)
}

extension Color {

    /// Returns a HSB saturation percentage value ranging from ```0``` to ```1.0```.
    public var hsbSaturation: Percent {
        get {
            return hsb(from: (red: red, green: green, blue: blue)).saturation
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (hue: hue, saturation: value, brightness: hsbBrightness)))
        }
    }

    /// Returns a HSB lightness percentage value ranging from ```0``` to ```1.0```.
    public var hsbBrightness: Percent {
        get {
            return hsb(from: (red: red, green: green, blue: blue)).brightness
        }
        set {
            let value = limitToPercentRange(newValue)
            set(from: rgb(from: (hue: hue, saturation: hsbSaturation, brightness: value)))
        }
    }

}
