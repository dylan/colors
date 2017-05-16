//
//  ColorSpace.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 5/8/17.
//  Copyright © 2017 Colors. All rights reserved.
//

/// Represents one of several supported color spaces supported by `Color`.
public enum ColorSpace {
    case rgb
    case hsl
    case hsv
    case cmyk
    case xyz
    case lab

    var componentCount: Int {
        switch self {
        case .rgb, .hsl, .hsv, .xyz, .lab:
            return 3
        case .cmyk:
            return 4
        }
    }
}
