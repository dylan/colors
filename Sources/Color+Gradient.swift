//
//  Color+Gradient.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {

    /// Represents the type of interpolation used when sampling colors.
    /// 
    /// - note:
    ///     - `.rgb` represent lerping across the RGB values of a color.
    ///     - `.hue` represents only lerping on the hue component.
    public enum Interpolation {
        case rgb
        case hue
    }

    /// Samples a color across an `interpolation` type at a given position.
    ///
    /// - Parameters:
    ///     - a: The starting color of the interpolation.
    ///     - b: The ending color of the interpolation.
    ///     - position: At what point in the interpolation the `Color` is sampled.
    ///     - interpolation: What interpolation method to use.
    /// - Returns: The sampled `Color`.
    public static func sample(from a: Color, through b: Color, at position: Float, using interpolation: Interpolation = .hue) -> Color {

        func lerp(from a: Float, to b: Float, percent: Float) -> Float {
            return (b - a) * percent + a
        }

        func hueLerpValues(a: Color, b: Color, percent: Percent) -> HSLComponents {
            var tempA = a
            var tempB = b
            var result = HSLComponents(hue: 0, saturation: 0, luminosity: 0)
            var delta = tempB.hsl.hue - tempA.hsl.hue
            var p = percent

            if tempA.hsl.hue > tempB.hsl.hue {
                let temp = tempB
                tempB = tempA
                tempA = temp

                delta = -1 * delta
                p = 1 - percent
            }

            if delta > 0.5 {
                tempA.hsl.hue = tempA.hsl.hue + 1.0
                result.hue = (tempA.hsl.hue + p * (tempB.hsl.hue - tempA.hsl.hue))
            }

            if delta <= 0.5 {
                result.hue = tempA.hsl.hue + p * delta
            }

            // Hack to make sure we cross over correctly.
            if result.hue > 1.0 {
                result.hue -= 1.0
            }

            return (hue: result.hue,
                    saturation: lerp(from: tempA.hsl.saturation, to: tempB.hsl.saturation, percent: p),
                    luminosity: lerp(from: tempA.hsl.luminosity, to: tempB.hsl.luminosity, percent: p))
        }

        switch interpolation {
        case .hue:
            var result = Color(hueLerpValues(a: a, b: b, percent: position))
            result.alpha = lerp(from: a.alpha, to: b.alpha, percent: position)
            return result
        case .rgb:
            return Color(red:   lerp(from: a.rgb.red,   to: b.rgb.red,   percent: position),
                         green: lerp(from: a.rgb.green, to: b.rgb.green, percent: position),
                         blue:  lerp(from: a.rgb.blue,  to: b.rgb.blue,  percent: position),
                         alpha: lerp(from: a.alpha, to: b.alpha, percent: position))
        }
    }

    /// Given an array of `Color`s, sample across an interpolation until we have a spread or gradient.
    ///
    /// - Parameters:
    ///     - colors: The array of `Colors` to interpolate through.
    ///     - size: The desired size of the final spread or gradient.
    ///     - interpolation: What interpolation method to use.
    /// - Returns: The sampled `Color`s.
    public static func spread(colors: [Color], to size: Int, using interpolation: Interpolation = .hue) -> [Color] {
        var result = [Color]()
        let dividingFactor = Float(colors.count - 1) / Float(size - 1)
        for i in 0..<size {
            let tmp         = Float(i) * dividingFactor
            let priorIndex  = Int(floor(tmp))
            let nextIndex   = Int(ceil(tmp))
            let percent     = tmp - Float(priorIndex)
            let color       = Color.sample(from: colors[priorIndex], through: colors[nextIndex], at: percent, using: interpolation)
            result.append(color)
        }
        return result
    }
}
