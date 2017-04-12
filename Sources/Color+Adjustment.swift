//
//  Color+Adjustment.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation


public func shiftHue(of color: Color, degrees: Degree) -> Color {
    guard degrees != 0 || degrees != 360 else {
        return color
    }

    var result = color
    result.hue += degrees
    return result
}

public func darken(_ color: Color, percent: Percent) -> Color {
    guard percent != 0 else {
        return color
    }

    var result = color
    result.hslLightness -= percent
    return result
}

public func lighten(_ color: Color, percent: Percent) -> Color {
    guard percent != 0 else {
        return color
    }

    var result = color
    result.hslLightness += percent
    return result
}

public func saturate(_ color: Color, percent: Percent) -> Color {
    guard percent != 0 else {
        return color
    }

    var result = color
    result.hslSaturation += percent
    return result
}

public func desaturate(_ color: Color, percent: Percent) -> Color {
    guard percent != 0 else {
        return color
    }

    var result = color
    result.hslSaturation -= percent
    return result
}

public func mix(_ a: Color, with b: Color, percent: Percent) -> Color {
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
