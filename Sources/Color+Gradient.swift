//
//  Color+Gradient.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {

    public enum Interpolation {
        case rgb
        case hue
    }

    public static func sample(from a: Color, through b: Color, at position: Float, using interpolation: Interpolation = .hue) -> Color {

        func lerp(from a: Float, to b: Float, percent: Float) -> Float {
            return (b - a) * percent + a
        }

        func hueLerpValues(a: Color, b: Color, percent: Percent) -> HSLTuple {
            var tempA = a
            var tempB = b
            var result = HSLTuple(h: 0, s: 0, l: 0)
            var delta = tempB.hue - tempA.hue
            var p = percent

            if tempA.hue > tempB.hue {
                let temp = tempB
                tempB = tempA
                tempA = temp

                delta = -1 * delta
                p = 1 - percent
            }

            if delta > 0.5 {
                tempA.hue = tempA.hue + 1.0
                result.h = (tempA.hue + p * (tempB.hue - tempA.hue))
            }

            if delta <= 0.5 {
                result.h = tempA.hue + p * delta
            }

            // Hack to make sure we cross over correctly.
            if result.h > 1.0 {
                result.h -= 1.0
            }

            return (h: result.h / 360,
                    s: lerp(from: tempA.hslSaturation, to: tempB.hslSaturation, percent: p),
                    l: lerp(from: tempA.hslLightness, to: tempB.hslLightness, percent: p))
        }

        switch interpolation {
        case .hue:
            let rgbValues = rgb(from: hueLerpValues(a: a, b: b, percent: position))
            return Color(red:   rgbValues.r,
                         green: rgbValues.g,
                         blue:  rgbValues.b,
                         alpha: lerp(from: a.alpha, to: b.alpha, percent: position))
        case .rgb:
            return Color(red:   lerp(from: a.red,   to: b.red,   percent: position),
                         green: lerp(from: a.green, to: b.green, percent: position),
                         blue:  lerp(from: a.blue,  to: b.blue,  percent: position),
                         alpha: lerp(from: a.alpha, to: b.alpha, percent: position))
        }
    }

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
