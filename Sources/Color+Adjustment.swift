//
//  Color+Adjustment.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

extension Color {

    /// Shifts the hue attribute of a given `Color` by the given amount in degrees.
    ///
    /// - Parameters:
    ///     - color: The source color to hue shift.
    ///     - degrees: The amount to shift the source `Color`'s hue by in degrees.
    /// - Returns: The final `Color`.
    public static func shiftHue(of color: Color, degrees: Degree) -> Color {
        guard degrees != 0 || degrees != 360 else {
            return color
        }

        var result = color
        result.hsl.hue = (result.hsl.hue + degrees).degrees
        return result
    }

    /// Darkens a given color by the given percentage.
    ///
    /// - Parameters:
    ///     - color: The source color to darken.
    ///     - percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public static func darken(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hsl.luminosity -= (result.hsl.luminosity * percent).percent
        return result
    }

    /// Lightens a given color by the given percentage.
    ///
    /// - Parameters:
    ///     - color: The source color to lighten.
    ///     - percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public static func lighten(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hsl.luminosity += (result.hsl.luminosity * percent).percent
        return result
    }

    /// Saturates a given color by the given percentage.
    ///
    /// - Parameters:
    ///     - color: The source color to saturate.
    ///     - percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public static func saturate(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hsl.saturation += (result.hsl.saturation * percent).percent
        return result
    }

    /// Desaturates a given color by the given percentage.
    ///
    /// - Parameters:
    ///     - color: The source color to desaturate.
    ///     - percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public static func desaturate(_ color: Color, percent: Percent) -> Color {
        guard percent != 0 else {
            return color
        }

        var result = color
        result.hsl.saturation -= (result.hsl.saturation * percent).percent
        return result
    }

    /// Mixes a given color with another by the given percentage.
    ///
    /// - Parameters:
    ///     - a: The source color to mix.
    ///     - b: The color to add to the source.
    ///     - percent: How much of the new color should be comprised of the added color.
    /// - Returns: The final `Color`.
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

        return Color(red:   mix(a: a.rgb.red,   b: b.rgb.red,   percent: percent),
                     green: mix(a: a.rgb.green, b: b.rgb.green, percent: percent),
                     blue:  mix(a: a.rgb.blue,  b: b.rgb.blue,  percent: percent),
                     alpha: mix(a: a.alpha,     b: b.alpha,     percent: percent))

    }

    /// Returns a copy of the base `Color` with it's hue shifted by the given degrees.
    ///
    /// - Parameter degrees: The number of degrees to shift by.
    /// - Returns: The final `Color`.
    public func hueShifted(_ degrees: Degree) -> Color {
        return Color.shiftHue(of: self, degrees: degrees)
    }

    /// Returns a copy of the base `Color` darkened by the given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public func darkened(_ percent: Percent) -> Color {
        return Color.darken(self, percent: percent)
    }

    /// Returns a copy of the base `Color` lightened by the given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public func lightened(_ percent: Percent) -> Color {
        return Color.lighten(self, percent: percent)
    }

    /// Returns a copy of the base `Color` saturated by the given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public func saturated(_ percent: Percent) -> Color {
        return Color.saturate(self, percent: percent)
    }

    /// Returns a copy of the base `Color` desaturated by the given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public func desaturated(_ percent: Percent) -> Color {
        return Color.desaturate(self, percent: percent)
    }

    /// Returns a copy of the base `Color` mixed with a given `Color` by the given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    /// - Returns: The final `Color`.
    public func mixed(with color: Color, percent: Percent) -> Color {
        return Color.mix(self, with: color, percent: percent)
    }

    /// Shifts the hue of this `Color` by a given angle in degrees.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func hueShift(_ degrees: Degree) {
        self = self.hueShifted(degrees)
    }

    /// Darkens this `Color` by a given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func darken(_ percent: Percent) {
        self = self.darkened(percent)
    }

    /// Lighten this `Color` by a given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func lighten(_ percent: Percent) {
        self = self.lightened(percent)
    }

    /// Saturate this `Color` by a given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func saturate(_ percent: Percent) {
        self = self.saturated(percent)
    }

    /// Desaturate this `Color` by a given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func desaturate(_ percent: Percent) {
        self = self.desaturated(percent)
    }

    /// Mix this `Color` with a given `Color` by a given percentage.
    ///
    /// - Parameter percent: A percentage in decimal form.
    public mutating func mix(with color: Color, percent: Percent) {
        self = self.mixed(with: color, percent: percent)
    }
}
