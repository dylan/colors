//
//  Color+Adjustment.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

extension Color {
    public static func shiftHue(of color: Color, degrees: Degree) -> Color {
        guard degrees != 0 || degrees != 360 else {
            return color
        }

        var result = color
        result.hue += degrees
        return result
    }

    public static func darken(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hslLightness -= percent
        return result
    }

    public static func lighten(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hslLightness += percent
        return result
    }

    public static func saturate(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hslSaturation += percent
        return result
    }

    public static func desaturate(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hslSaturation -= percent
        return result
    }

    public static func mix(_ a: Color, with b: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return a
        }
        guard percent != 1.0 else {
            return b
        }

        func mix(a: Float, b: Float, percent: Float) -> Float {
            return ((b - a) * percent) + a
        }

        return Color(red:   mix(a: a.red, b: b.red, percent: percent),
                     green: mix(a: a.green, b: b.green, percent: percent),
                     blue:  mix(a: a.blue, b: b.blue, percent: percent),
                     alpha: mix(a: a.alpha, b: b.alpha, percent: percent))

    }

    public func hueShifted(_ degrees: Degree) -> Color {
        return Color.shiftHue(of: self, degrees: degrees)
    }

    public func darkened(_ percent: Percent) -> Color {
        return Color.darken(self, percent: percent)
    }

    public func lightened(_ percent: Percent) -> Color {
        return Color.lighten(self, percent: percent)
    }

    public func saturated(_ percent: Percent) -> Color {
        return Color.saturate(self, percent: percent)
    }

    public func desaturated(_ percent: Percent) -> Color {
        return Color.desaturate(self, percent: percent)
    }

    public func mixed(with color: Color, percent: Percent) -> Color {
        return Color.mix(self, with: color, percent: percent)
    }

    public mutating func hueShift(_ degrees: Degree) {
        self = self.hueShifted(degrees)
    }

    public mutating func darken(_ percent: Percent) {
        self = self.darkened(percent)
    }

    public mutating func lighten(_ percent: Percent) {
        self = self.lightened(percent)
    }

    public mutating func saturate(_ percent: Percent) {
        self = self.saturated(percent)
    }

    public mutating func desaturate(_ percent: Percent) {
        self = self.desaturated(percent)
    }

    public mutating func mix(with color: Color, percent: Percent) {
        self = self.mixed(with: color, percent: percent)
    }
}
