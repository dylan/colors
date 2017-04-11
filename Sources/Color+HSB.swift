//
//  Color+HSB.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

func hsb(from tuple: RGBTuple) -> HSBTuple {
    let red   = tuple.r
    let green = tuple.g
    let blue  = tuple.b

    let maxComponent = max(red, green, blue)
    let minComponent = min(red, green, blue)

    let delta     = maxComponent - minComponent

    var hue        = maxComponent
    var saturation = maxComponent == 0 ? 0 : delta / maxComponent
    let lightness  = maxComponent

    if maxComponent == minComponent {
        hue = 0
        saturation = 0
    } else {
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

    return HSBTuple(h: hue, s: saturation, b: lightness)
}

func rgb(from tuple: HSBTuple) -> RGBTuple {
    let hue = tuple.h
    let saturation = tuple.s
    let brightness = tuple.b

    var i = floor(hue)
    var f = hue - i
    var p = brightness * (1 - saturation)
    var q = brightness * (1 - f * saturation)
    var t = brightness * (1 - (1 - f) * saturation)
    var mod = Int(i.remainder(dividingBy: 6))
    var red =   [brightness, q, p, p, t, brightness][mod]
    var green = [t, brightness, brightness, q, p, p][mod]
    var blue =  [p, p, t, brightness, brightness, q][mod]

    return RGBTuple(r: red, g: green, b: blue)
}

extension Color {

    /// Returns a lightness percentage value ranging from ```0``` to ```1.0```.
    public var hsbSaturation: Percent {
        get {
            return 0
        }
        set {
            //            let value = limitToPercentRange(newValue)
            //            set(from: rgb(from: (h: hue / 360, s: saturation, l: value)))
            
        }
    }

    /// Returns a lightness percentage value ranging from ```0``` to ```1.0```.
    public var hsbBrightness: Percent {
        get {
            return 0
        }
        set {
//            let value = limitToPercentRange(newValue)
//            set(from: rgb(from: (h: hue / 360, s: saturation, l: value)))

        }
    }

}
