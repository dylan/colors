//
//  Color+Conversion.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 5/8/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {

    /// Returns a new `Color` converted from it's original `ColorSpace` to the specified one.
    ///
    /// - Note: If a conversion is unsupported, the `Color` is converted to the RGB `ColorSpace` and then a conversion is attempted again.
    ///
    public func converted(to target: ColorSpace) -> Color {
        guard space != target else {
            return self
        }

        switch (space, target) {
        case (.rgb, .hsl):
            return rgb2hsl()
        case (.rgb, .hsv):
            return rgb2hsv()
        case (.rgb, .cmyk):
            return rgb2cmyk()
        case (.hsl, .rgb):
            return hsl2rgb()
        case (.hsl, .hsv):
            return hsl2hsv()
        case (.hsv, .rgb):
            return hsv2rgb()
        case (.hsv, .hsl):
            return hsv2hsl()
        case (.cmyk, .rgb):
            return cmyk2rgb()
        default:
            switch space {
            // If we cannot convert directly, convert to rgb, then convert to final.
            case .hsl, .hsv, .cmyk:
                return self.converted(to: .rgb).converted(to: target)
            default:
                return self
            }
        }
    }

    private
    func rgb2hsl() -> Color {
        let r = components[0]
        let g = components[1]
        let b = components[2]

        let min = Swift.min(r, g, b)
        let max = Swift.max(r, g, b)
        let delta = max - min

        var h: Float = 0
        var s: Float = 0
        var l: Float = 0

        if max == min {
            h = 0
        } else if max == r {
            h = (g - b) / delta
        } else if max == g {
            h = 2 + (b - r) / delta
        } else if max == b {
            h = 4 + (r - g) / delta
        }

        h = Swift.min(h * 60, 360)

        if h < 0 {
            h += 360
        }

        l = (min + max) / 2

        if max == min {
            s = 0
        } else if l <= 0.5 {
            s = delta / (max + min)
        } else {
            s = delta / (2 - max - min)
        }

        return Color([h / 360, s, l], space: .hsl)
    }

    private
    func rgb2hsv() -> Color {
        let r = components[0]
        let g = components[1]
        let b = components[2]

        let min = Swift.min(r, g, b)
        let max = Swift.max(r, g, b)
        let delta = max - min

        var h: Float = 0
        var s: Float = 0
        var v: Float = 0

        if max == min {
            s = 0
        } else {
            s = delta / max
        }

        if max == min {
            h = 0
        } else if max == r {
            h = (g - b) / delta
        } else if max == g {
            h = 2 + (b - r) / delta
        } else if max == b {
            h = 4 + (r - g) / delta
        }

        h = Swift.min(h * 60, 360)

        if h < 0 {
            h += 360
        }

        v = max

        return Color([h / 360, s, v], space: .hsv)
    }

    private
    func rgb2cmyk() -> Color {
        let r = components[0]
        let g = components[1]
        let b = components[2]

        var c, m, y, k: Float

        k = min(1 - r, 1 - g, 1 - b)
        c = (1 - r - k) / (1 - k)
        m = (1 - g - k) / (1 - k)
        y = (1 - b - k) / (1 - k)

        c = c.isNaN ? 0 : c
        m = m.isNaN ? 0 : c
        y = y.isNaN ? 0 : c

        return Color(cyan: c, magenta: m, yellow: y, key: k)
    }

    private
    func hsl2rgb() -> Color {
        let h = components[0]
        let s = components[1]
        let l = components[2]

        var rgb: ColorComponents = [0,0,0]

        if s == 0 {
            return Color(red: l, green: l, blue: l)
        }

        let temp2 = l < 0.5 ? l * (1 + s) : l + s - l * s
        let temp1 = 2 * l - temp2

        rgb[0] = (h + 1 / 3).truncatingRemainder(dividingBy: 1)
        rgb[1] = h
        rgb[2] = (h + 2 / 3).truncatingRemainder(dividingBy: 1)

        for i in 0..<ColorSpace.rgb.componentCount {
            // Worst ternary ever written
            rgb[i] = rgb[i] < 1 / 6 ? temp1 + (temp2 - temp1) * 6 * rgb[i] : rgb[i] < 1 / 2 ? temp2 : rgb[i] < 2 / 3 ? temp1 + (temp2 - temp1) * 6 * (2 / 3 - rgb[i]) : temp1
        }

        return Color(rgb, space: .rgb)
    }

    private
    func hsl2hsv() -> Color {
        let h = components[0] * 360
        var s = components[1]
        var l = components[2]
        var smin = s
        let lmin = max(l, 0.01)
        var sv, v: Float

        l *= 2
        s *= l <= 1 ? l : 2 - l
        smin *= lmin <= 1 ? lmin : 2 - lmin
        v = (l + s) / 2
        sv = l == 0 ? (2 * smin) / (lmin + smin) : (2 * s) / (l + s)

        return Color(hue: h / 360, saturation: sv, value: v)
    }

    private
    func hsv2rgb() -> Color {
        let h = (components[0] * 360 ) / 60
        let s = components[1]
        let v = components[2]

        let index = Int(h) % 6

        let f = h - floor(h)
        let p = v * (1 - s)
        let q = v * (1 - (s * f))
        let t = v * (1 - (s * (1 - f)))

        let values = [
            [v, t, p],
            [q, v, p],
            [p, v, t],
            [p, q, v],
            [t, p, v],
            [v, p, q]
            ][index]

        return Color(values, space: .rgb)
    }

    private
    func hsv2hsl() -> Color {
        let h = components[0] * 360
        let s = components[1]
        let v = components[2]
        let vmin = max(v, 0.01)
        var l = (2 - s) * v
        let lmin = (2 - s) * vmin
        var sl = s * vmin
        sl /= lmin <= 1 ? lmin : 2 - lmin
        sl = sl < 0 ? 0 : sl
        l /= 2

        return Color(hue: h / 360, saturation: sl, luminosity: l)
    }

    private
    func cmyk2rgb() -> Color {
        let c = components[0]
        let m = components[1]
        let y = components[2]
        let k = components[3]

        var r, g, b: Float

        r = 1 - min(1, c * (1 - k) + k)
        g = 1 - min(1, m * (1 - k) + k)
        b = 1 - min(1, y * (1 - k) + k)

        return Color(red: r, green: g, blue: b)
    }

    static func hex2rgb(_ hex: Int) -> Color {
        return Color(redInt:   (hex & 0xff0000) >> 16,
                     greenInt: (hex & 0x00ff00) >> 8,
                     blueInt:  hex & 0x0000ff)
    }
    
    static func hexString2rgb(_ hex: String) -> Color {
        let scanner = Scanner(string: hex)
        var value = 0
        scanner.scanInt(&value)
        return Color(hex: value)
    }
}

extension Color {

    /// Represents the converted RGB components of this `Color`.
    ///
    public var rgb: RGBComponents {
        get {
            let values = self.converted(to: .rgb).components
            return (red: values[0], green: values[1], blue: values[2])
        }
        set {
            self = Color(newValue)
        }
    }

    /// Represents the converted HSL components of this `Color`.
    ///
    public var hsl: HSLComponents {
        get {
            let values = self.converted(to: .hsl).components
            return (hue: values[0], saturation: values[1], luminosity: values[2])
        }
        set {
            self = Color(newValue)
        }
    }

    /// Represents the converted HSV components of this `Color`.
    ///
    public var hsv: HSVComponents {
        get {
            let values = self.converted(to: .hsv).components
            return (hue: values[0], saturation: values[1], value: values[2])
        }
        set {
            self = Color(newValue)
        }
    }

    /// Represents the converted CMYK components of this `Color`.
    ///
    public var cmyk: CMYKComponents {
        get {
            let values = self.converted(to: .cmyk).components
            return (cyan: values[0], magenta: values[1], yellow: values[2], key: values[3])
        }
        set {
            self = Color(newValue)
        }
    }

    /// Represents the converted `Int` value of this `Color`.
    ///
    public var hex: Int {
        get {
            return (Int(self.rgb.red   * 255)) << 16 +
                   (Int(self.rgb.green * 255)) << 8  +
                   (Int(self.rgb.blue  * 255))
        }
        set {
            self = Color(hex: newValue)
        }
    }
    
    /// Represents the converted hex `String` value of this `Color`.
    ///
    public var hexString: String {
        get {
            return String(format: "#%02lx%02lx%02lx",
                          Int(self.rgb.red * 255),
                          Int(self.rgb.green * 255),
                          Int(self.rgb.blue * 255))
        }
        set {
            self = Color.hexString2rgb(newValue)
        }
    }
}
