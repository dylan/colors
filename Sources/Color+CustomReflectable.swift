//
//  Color+CustomReflectable.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 6/9/17.
//  Copyright © 2017 Colors. All rights reserved.
//

extension Color: CustomReflectable {
    public var customMirror: Mirror {
        let children: DictionaryLiteral<String, Any>
        switch self.space {
        case .rgb:
            children = ["red": self.rgb.red, "green": self.rgb.green, "blue": self.rgb.blue, "hex": self.hexString]
        case .hsl:
            children = ["hue": self.hsl.hue, "saturation": self.hsl.saturation, "luminosity": self.hsl.luminosity, "hex": self.hexString]
        case .cmyk:
            children = ["c": self.cmyk.cyan, "m": self.cmyk.magenta, "y": self.cmyk.yellow, "k": self.cmyk.key, "hex": self.hexString]
        case .hsv:
            children = ["h": self.hsv.hue, "s": self.hsv.saturation, "l": self.hsv.value, "hex": self.hexString]
        case .lab:
            children = ["l": self.lab.l, "a": self.lab.a, "b": self.lab.b, "hex": self.hexString]
        case .xyz:
            children = ["x": self.xyz.x, "y": self.xyz.y, "z": self.xyz.z, "hex": self.hexString]
        }
        return Mirror.init(self, children: children, displayStyle: Mirror.DisplayStyle.tuple, ancestorRepresentation: Mirror.AncestorRepresentation.generated)
    }
}
