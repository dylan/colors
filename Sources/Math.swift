//
//  Math.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

func limitToDegreeRange(_ value: Degree) -> Degree {
    let adjustedValue = value.remainder(dividingBy: 360)
    return adjustedValue < 0 ? 360 + adjustedValue : adjustedValue
}

func limitToPercentRange(_ value: Percent) -> Percent {
    return clamp(value, between: 0, and: 1.0)
}

func limitTo8BitRange(_ value: Percent) -> EightBitValue {
    return clamp(UInt8(value), between: 0, and: 255)
}

func clamp<T: Comparable>(_ value: T, between a: T, and b: T) -> T {
    return min(max(value, a), b)
}

public func convert(from value: Percent) -> EightBitValue {
    return limitTo8BitRange(round(value * 255.0))
}

public func convert(from value: EightBitValue) -> Percent {
    return limitToPercentRange(Float(value) / 255.0)
}
