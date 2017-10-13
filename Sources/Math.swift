//
//  Math.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

public let EPSILON: Float = 1e-4

func round<x: FloatingPoint>(_ value: x, toNearest: x) -> x {
    guard value != 0 else {
        return 0
    }
    return round(value / toNearest) * toNearest
}

func limit<x: FloatingPoint>(_ value: x, to limit: x) -> x {
    let adjustedValue = value.remainder(dividingBy: limit)
    return adjustedValue < 0 ? limit + adjustedValue : adjustedValue
}

func limitToDegreeRange(_ value: Degree) -> Degree {
    return limit(value, to: 360)
}

func limitToPercentRange(_ value: Percent) -> Percent {
    return limit(value, to: 100)
}

func limitTo8BitRange(_ value: Percent) -> EightBitValue {
    return clamp(UInt8(value), between: 0, and: 255)
}

public func clamp<T: Comparable>(_ value: T, between a: T, and b: T) -> T {
    return min(max(value, a), b)
}

extension Float {
    public func clamped(to range: ClosedRange<Float>) -> Float {
        return clamp(self, between: range.lowerBound, and: range.upperBound)
    }
}
