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

typealias RGBTuple = (red: Percent, green: Percent, blue: Percent)
typealias RGBATuple = (red: Percent, green: Percent, blue: Percent, alpha: Percent)

typealias HSLTuple = (hue: Degree, saturation: Percent, lightness: Percent)
typealias HSLATuple = (hue: Degree, saturation: Percent, lightness: Percent, alpha: Percent)

typealias HSBTuple = (hue: Degree, saturation: Percent, brightness: Percent)
typealias HSBATuple = (hue: Degree, saturation: Percent, brightness: Percent, alpha: Percent)
