//
//  Conversions.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/6/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

// MARK: - RGB

internal func rgb(from rgba: RGBA) -> RGB {
    return RGB(rgba.redComponent, rgba.greenComponent, rgba.blueComponent)
}

internal func rgb(from hsl: HSL) -> RGB {
    var hue        = hsl.hueComponent
    var saturation = hsl.saturationComponent
    var lightness  = hsl.lightnessComponent

    var m1: CGFloat = 0.0
    var m2: CGFloat = 0.0

    if lightness <= 0.5 {
        m2 = lightness * (saturation + 1)
    } else {
        m2 = lightness + saturation - lightness * saturation
    }

    m1 = lightness * 2 - m2

    func hueToRgb(m1: CGFloat, m2: CGFloat, hue: CGFloat) -> CGFloat {
        var hue = hue
        if hue < 0 { hue += 1 }
        if hue > 1 { hue -= 1 }

        if hue * 6 < 1 { return m1 + (m2 - m1) * hue * 6 }
        if hue * 2 < 1 { return m2 }
        if hue * 3 < 2 { return m1 + (m2 - m1) * (2 / 3 - hue) * 6 }
        return m1
    }
    let r = hueToRgb(m1: m1, m2: m2, hue: hue + 1.0 / 3.0)
    let g = hueToRgb(m1: m1, m2: m2, hue: hue)
    let b = hueToRgb(m1: m1, m2: m2, hue: hue - 1.0 / 3.0)
    return RGB(r, g, b)
}

internal func rgb(from hsla: HSLA) -> RGB {
    return rgb(from: hsl(from: hsla))
}

internal func rgb(from hsb: HSB) -> RGB {
    return RGB(hsb.osColor.redComponent,
               hsb.osColor.greenComponent,
               hsb.osColor.blueComponent)
}

internal func rgb(from hsba: HSBA) -> RGB {
    return RGB(hsba.osColor.redComponent,
               hsba.osColor.greenComponent,
               hsba.osColor.blueComponent)
}

// MARK: - RGBA

internal func rgba(from rgb: RGB) -> RGBA {
    return RGBA(rgb.redComponent, rgb.greenComponent, rgb.blueComponent, 1.0)
}

internal func rgba(from hsl: HSL) -> RGBA {
    let result = rgb(from: hsl)
    return RGBA(result.redComponent, result.greenComponent, result.blueComponent, 1.0)
}

internal func rgba(from hsla: HSLA) -> RGBA {
    let result = rgb(from: hsla)
    return RGBA(result.redComponent, result.greenComponent, result.blueComponent, hsla.alphaComponent)
}

internal func rgba(from hsb: HSB) -> RGBA {
    let result = rgb(from: hsb)
    return RGBA(result.redComponent, result.greenComponent, result.blueComponent, 1.0)
}

internal func rgba(from hsba: HSBA) -> RGBA {
    let result = rgb(from: hsba)
    return RGBA(result.redComponent, result.greenComponent, result.blueComponent, hsba.alphaComponent)
}

// MARK: - HSL

internal func hsl(from rgb: RGB) -> HSL {
    let red   = rgb.redComponent
    let green = rgb.greenComponent
    let blue  = rgb.blueComponent

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
    var result = HSL(0, saturation, lightness)
    result.hueComponent = hue
    return result
}

internal func hsl(from rgba: RGBA) -> HSL {
    return hsl(from: rgb(from: rgba))
}

internal func hsl(from hsb: HSB) -> HSL {
    let hue        = hsb.hueComponent
    var saturation = hsb.saturationComponent
    let value      = hsb.brightnessComponent

    let lightness = (2.0 - saturation) * value / 2.0

    if lightness != 0 {
        if lightness == 1 {
            saturation = 0
        } else if (lightness < 0.5) {
            saturation = saturation * value / (lightness * 2.0.cgFloat)
        } else {
            saturation = saturation * value / (2 - lightness * 2)
        }
    }
    var result = HSL(0, saturation, lightness)
    result.hueComponent = hue
    return result
}

internal func hsl(from hsba: HSBA) -> HSL {
    return hsl(from: hsb(from: hsba))
}

internal func hsl(from hsla: HSLA) -> HSL {
    var result = HSL(0, hsla.saturationComponent, hsla.lightnessComponent)
    result.hueComponent = hsla.hueComponent
    return result
}

// MARK: - HSLA
internal func hsla(from rgb: RGB) -> HSLA {
    return hsla(from: hsl(from: rgb))
}

internal func hsla(from rgba: RGBA) -> HSLA {
    var value = hsla(from: hsl(from: rgba))
    value.alphaComponent = rgba.alphaComponent
    return value
}

internal func hsla(from hsl: HSL) -> HSLA {
    var result = HSLA(0, hsl.saturationComponent, hsl.lightnessComponent, 1.0)
    result.hueComponent = hsl.hueComponent
    return result
}

internal func hsla(from hsb: HSB) -> HSLA {
    return hsla(from: hsl(from: hsb))
}

internal func hsla(from hsba: HSBA) -> HSLA {
    var value = hsla(from: hsl(from: hsba))
    value.alphaComponent = hsba.alphaComponent
    return value
}

// MARK: - HSB
internal func hsb(from rgb: RGB) -> HSB {
    var result = HSB(0,
                      rgb.osColor.saturationComponent,
                      rgb.osColor.brightnessComponent)
    result.hueComponent = rgb.osColor.hueComponent
    return result
}

internal func hsb(from rgba: RGBA) -> HSB {
    return hsb(from: rgb(from: rgba))
}

internal func hsb(from hsl: HSL) -> HSB {
    return hsb(from: rgb(from: hsl))
}

internal func hsb(from hsla: HSLA) -> HSB {
    return hsb(from: rgb(from: hsla))
}

internal func hsb(from hsba: HSBA) -> HSB {
    return hsb(from: rgb(from: hsba))
}

// MARK: - HSBA
internal func hsba(from rgb: RGB) -> HSBA {
    return hsba(from: rgba(from: rgb))
}

internal func hsba(from rgba: RGBA) -> HSBA {
    var result = HSBA(0,
                      rgba.osColor.saturationComponent,
                      rgba.osColor.brightnessComponent,
                      rgba.osColor.alphaComponent)
    result.hueComponent = rgba.osColor.hueComponent
    return result
}

internal func hsba(from hsl: HSL) -> HSBA {
    return hsba(from: rgba(from: hsl))
}

internal func hsba(from hsla: HSLA) -> HSBA {
    return hsba(from: rgba(from: hsla))
}

internal func hsba(from hsb: HSB) -> HSBA {
    return hsba(from: rgba(from: hsb))
}
