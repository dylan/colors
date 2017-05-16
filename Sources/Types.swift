//
//  Types.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

public typealias Hex           = UInt
public typealias EightBitValue = UInt8
public typealias Percent       = Float
public typealias Degree        = Float

/// Represents an array of float values used by `Color` to represent the components present. Must be compared to the `ColorSpace` to determine length.
public typealias ColorComponents = [Float]

public typealias RGBComponents   = (red: Float, green: Float, blue: Float)
public typealias HSLComponents   = (hue: Float, saturation: Float, luminosity: Float)
public typealias HSVComponents   = (hue: Float, saturation: Float, value: Float)
public typealias CMYKComponents  = (cyan: Float, magenta: Float, yellow: Float, key: Float)
public typealias XYZComponents = (x: Float, y: Float, z: Float)
public typealias LABComponents = (l: Float, a: Float, b: Float)
