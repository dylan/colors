//
//  Types.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/5/17.
//  Copyright © 2017 Colors. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

public typealias HSLATuple = (h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat)
public typealias HSLTuple  = (h: CGFloat, s: CGFloat, l: CGFloat)

public typealias HSBATuple = (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat)
public typealias HSBTuple  = (h: CGFloat, s: CGFloat, b: CGFloat)

public typealias RGBATuple = (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
public typealias RGBTuple  = (r: CGFloat, g: CGFloat, b: CGFloat)


public let HSLATupleBlack: HSLATuple = (h: 0.0, s: 0.0, l: 0.0, a: 1.0)
public let HSLTupleBlack:  HSLTuple  = (h: 0.0, s: 0.0, l: 0.0)

public let HSBATupleBlack: HSBATuple = (h: 0.0, s: 0.0, b: 0.0, a: 1.0)
public let HSBTupleBlack:  HSBTuple  = (h: 0.0, s: 0.0, b: 0.0)

public let RGBATupleBlack: RGBATuple = (r: 0.0, g: 0.0, b: 0.0, a: 1.0)
public let RGBTupleBlack:  RGBTuple  = (r: 0.0, g: 0.0, b: 0.0)
