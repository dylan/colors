//
//  Math.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/4/17.
//  Copyright © 2017 Colors. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

public protocol Numeric {
    var value: Double { get }
}

public protocol NumericValue: Numeric {
    var double: Double { get }
    var float: Float { get }
    var cgFloat: CGFloat { get }
    var int: Int { get }
}

extension NumericValue {
    public var float: Float {
        return Float(value)
    }
    public var double: Double {
        return Double(value)
    }
    public var cgFloat: CGFloat {
        return CGFloat(value)
    }
    public var int: Int {
        return Int(value)
    }
}

public func / (lhs: NumericValue, rhs: NumericValue) -> NumericValue {
    return lhs.value / rhs.value
}

public func * (lhs: NumericValue, rhs: NumericValue) -> NumericValue {
    return lhs.value * rhs.value
}

public func + (lhs: NumericValue, rhs: NumericValue) -> NumericValue {
    return lhs.value + rhs.value
}

public func - (lhs: NumericValue, rhs: NumericValue) -> NumericValue {
    return lhs.value - rhs.value
}


extension Int: NumericValue {
    public init(_ v: NumericValue) {
        self = v.int
    }
    public var value: Double {
        return Double(self)
    }
}

extension CGFloat: NumericValue {
    public init(_ v: NumericValue) {
        self = v.cgFloat
    }
    public var value: Double {
        return Double(self)
    }
}

extension Float: NumericValue {
    public init(_ v: NumericValue) {
        self = v.float
    }
    public var value: Double {
        return Double(self)
    }
}

extension Double: NumericValue {
    public init(_ v: NumericValue) {
        self = v.double
    }
    public var value: Double {
        return Double(self)
    }
}

public func mod(_ x: NumericValue, to y: NumericValue) -> Int {
    return ((x.int % y.int) + y.int) % y.int
}

public func clamp(_ x: NumericValue, to m: NumericValue) -> NumericValue {
    return min(max(x.value, 0.value), m.value)
}

public func clip(_ x: NumericValue, between minVal: NumericValue, and maxVal: NumericValue) -> NumericValue {
    return max(min(x.value, minVal.value), maxVal.value)
}

