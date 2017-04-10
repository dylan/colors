//
//  Colors.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on {TODAY}.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

public protocol Color {
    var rgb:  RGB  { get }
    var rgba: RGBA { get }
    var hsl:  HSL  { get }
    var hsla: HSLA { get }
    var hsb:  HSB  { get }
    var hsba: HSBA { get }

    var osColor: OSColor { get }

    var components: [CGFloat] { get }

    init(_ color: Color)
    init(_ components: [CGFloat])
}

extension Color where Self == RGB {
    public var components: [CGFloat] {
        return [redComponent, greenComponent, blueComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 3 else {
            fatalError("RGB requires 3 components to be initialized!")
        }
        self.init(components[0], components[1], components[2])
    }
}

extension Color where Self == RGBA {
    public var components: [CGFloat] {
        return [redComponent, greenComponent, blueComponent, alphaComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 4 else {
            fatalError("RGBA requires 4 components to be initialized!")
        }
        self.init(components[0], components[1], components[2], components[3])
    }
}

extension Color where Self == HSL {
    public var components: [CGFloat] {
        return [hueComponent, saturationComponent, lightnessComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 3 else {
            fatalError("HSL requires 3 components to be initialized!")
        }
        self.init(components[0], components[1], components[2])
    }
}

extension Color where Self == HSLA {
    public var components: [CGFloat] {
        return [hueComponent, saturationComponent, lightnessComponent, alphaComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 4 else {
            fatalError("HSLA requires 4 components to be initialized!")
        }
        self.init(components[0], components[1], components[2], components[3])
    }
}

extension Color where Self == HSB {
    public var components: [CGFloat] {
        return [hueComponent, saturationComponent, brightnessComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 3 else {
            fatalError("HSB requires 3 components to be initialized!")
        }
        self.init(components[0], components[1], components[2])
    }
}

extension Color where Self == HSBA {
    public var components: [CGFloat] {
        return [hueComponent, saturationComponent, brightnessComponent, alphaComponent]
    }

    public init(_ components: [CGFloat]) {
        guard components.count == 4 else {
            fatalError("HSBA requires 4 components to be initialized!")
        }
        self.init(components[0], components[1], components[2], components[3])
    }
}

extension Color {

    public var argbHex: Int {
        let rgbValue = self.rgba
        return (Int(rgbValue.alphaComponent * 255) << 24) +
               (Int(rgbValue.redComponent * 255)   << 16) +
               (Int(rgbValue.greenComponent * 255) << 8)  +
               (Int(rgbValue.blueComponent * 255))
    }

    public var rgbHex: Int {
        let rgbValue = self.rgb
        return (Int(rgbValue.redComponent * 255)   << 16) +
               (Int(rgbValue.greenComponent * 255) << 8)  +
               (Int(rgbValue.blueComponent * 255))
    }

    public static func sample(from a: Color, through b: Color, at position: CGFloat) -> Self {

        func lerp(from a: CGFloat, to b: CGFloat, percent: CGFloat) -> CGFloat {
            return (b - a) * percent + a
        }

        func straightLerpValues(a: [CGFloat], b: [CGFloat], percent: CGFloat) -> [CGFloat] {
            var result = [CGFloat]()
            for (index, aValue) in a.enumerated() {
                result.append(lerp(from: aValue, to: b[index], percent: percent))
            }
            return result
        }

        func hueLerpValues(a: HSB, b: HSB, percent: CGFloat) -> [CGFloat] {
            var tempA = a
            var tempB = b
            var result = HSB(0, 0, 0)
            var delta = tempB.hueComponent - tempA.hueComponent
            var p = percent

            if tempA.hueComponent > tempB.hueComponent {
                let temp = tempB
                tempB = tempA
                tempA = temp

                delta = -1 * delta
                p = 1 - percent
            }

            if delta > 0.5 {
                tempA.hueComponent = tempA.hueComponent + 1.0
                result.hueComponent = (tempA.hueComponent + p * (tempB.hueComponent - tempA.hueComponent))
            }

            if delta <= 0.5 {
                result.hueComponent = tempA.hueComponent + p * delta
            }

            // Hack to make sure we cross over correctly.
            if result.hueComponent > 1.0 {
                result.hueComponent -= 1.0
            }
            return [result.hueComponent,
                    lerp(from: tempA.saturationComponent, to: tempB.saturationComponent, percent: p),
                    lerp(from: tempA.brightnessComponent, to: tempB.brightnessComponent, percent: p)]
        }

        let lerpedValues: [CGFloat]
        if (Self.self as? HueBased.Type) != nil {
            lerpedValues = hueLerpValues(a: a.hsb, b: b.hsb, percent: position)
            var result = HSB(0, lerpedValues[1], lerpedValues[2])
            result.hueComponent = lerpedValues[0]
            return Self(result)
        } else {
            lerpedValues = straightLerpValues(a: Self(a).components, b: Self(b).components, percent: position)
            return Self(lerpedValues)
        }
    }

    public func sampleBetweenSelf(and color: Color, at position: CGFloat) -> Self {
        return Self.sample(from: self, through: color, at: position)
    }

    public static func gradient(from a: Color, through b: Color, steps: Int) -> [Self] {
        var result = [Self]()
        for i in 0..<steps {
            let color = Self.sample(from: a, through: b, at: CGFloat(i) / CGFloat(steps - 1))
            result.append(color)
        }
        return result
    }

    public func gradient(to color: Color, steps: Int) -> [Self] {
        return Self.gradient(from: self, through: color, steps: steps)
    }

    public static func spread(colors: [Color], to size: Int) -> [Self] {
        var result = [Self]()
        let dividingFactor = CGFloat(colors.count - 1) / CGFloat(size - 1)
        for i in 0..<size {
            let tmp         = CGFloat(i) * dividingFactor
            let priorIndex  = Int(floor(tmp))
            let nextIndex   = Int(ceil(tmp))
            let percent     = tmp - CGFloat(priorIndex)
            let color       = Self.sample(from: colors[priorIndex], through: colors[nextIndex], at: percent)
            result.append(color)
        }
        return result
    }
}

public protocol Alpha {
    var alphaComponent: CGFloat { get }
}

public protocol HueBased {
    var hueComponent: CGFloat { get }
    var saturationComponent: CGFloat { get }
}

extension HSL: HueBased {}
extension HSLA: HueBased {}
extension HSB: HueBased {}
extension HSBA: HueBased {}
