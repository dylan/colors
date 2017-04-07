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

    public static func lerpedColor(from a: Color, through b: Color, at position: CGFloat) -> Self {
        func lerp(from a: CGFloat, to b: CGFloat, percent: CGFloat) -> CGFloat {
            return (b - a) * percent + a
        }

        func lerpValues(a: [CGFloat], b: [CGFloat], percent: CGFloat) -> [CGFloat] {
            var result = [CGFloat]()
            for (index, aValue) in a.enumerated() {
                result.append(lerp(from: aValue, to: b[index], percent: percent))
            }
            return result
        }
        
        let lerpedValues = lerpValues(a: Self(a).components, b: Self(b).components, percent: position)

        return Self(lerpedValues)
//        return Self(RGBA(r, g, b, a))
    }

}

public protocol Alpha {
    var alphaComponent: CGFloat { get }
}
