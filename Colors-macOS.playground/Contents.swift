//: Playground - noun: a place where people can play

//import UIKit
import AppKit
import Colors

let rgbInt = RGB(0, 0, 0)

extension RGB {
    // Standard colors
    public static var black: RGB { return RGB(0,0,0)       }
    public static var red:   RGB { return RGB(255,0,0)     }
    public static var green: RGB { return RGB(0,255,0)     }
    public static var blue:  RGB { return RGB(0,0,255)     }
    public static var white: RGB { return RGB(255,255,255) }
}

let firstColor = RGB.black
let hsl        = HSL(firstColor)
let hsla       = HSLA(hsl)
let hsb        = HSB(hsla)
let hsba       = HSBA(hsb)

let colors: [RGB] = [RGB.green, hsl.rgb, hsla.rgb, hsb.rgb, hsba.rgb]
colors.osColors()
colors.nsColors()

firstColor.rgba.redComponent
firstColor.rgba.greenComponent
firstColor.rgba.blueComponent
firstColor.rgba.alphaComponent

hsl.hueComponent
hsl.saturationComponent
hsl.lightnessComponent

hsla.hueComponent
hsla.saturationComponent
hsla.lightnessComponent
hsla.alphaComponent

hsb.hueComponent
hsb.saturationComponent
hsb.brightnessComponent

hsba.hueComponent
hsba.saturationComponent
hsba.brightnessComponent
hsba.alphaComponent

firstColor.rgba.redComponent
firstColor.rgba.greenComponent
firstColor.rgba.blueComponent
firstColor.rgba.alphaComponent

firstColor.rgba.hsl.hueComponent
firstColor.rgba.hsl.saturationComponent
firstColor.rgba.hsl.lightnessComponent

firstColor.rgba.hsl.hsla.hueComponent
firstColor.rgba.hsl.hsla.saturationComponent
firstColor.rgba.hsl.hsla.lightnessComponent

firstColor.rgba.hsl.hsla.hsb.hueComponent
firstColor.rgba.hsl.hsla.hsb.saturationComponent
firstColor.rgba.hsl.hsla.hsb.brightnessComponent

firstColor.rgba.hsl.hsla.hsb.rgb.redComponent
firstColor.rgba.hsl.hsla.hsb.rgb.greenComponent
firstColor.rgba.hsl.hsla.hsb.rgb.blueComponent

firstColor.rgba.hsl.hsla.hsb.hueComponent
firstColor.rgba.hsl.hsla.hsb.saturationComponent
firstColor.rgba.hsl.hsla.hsb.brightnessComponent

firstColor.rgba.hsl.hsla.hsb.hsba.hueComponent
firstColor.rgba.hsl.hsla.hsb.hsba.saturationComponent
firstColor.rgba.hsl.hsla.hsb.hsba.brightnessComponent
firstColor.rgba.hsl.hsla.hsb.hsba.alphaComponent

firstColor.rgba.hsl.hsla.hsb.hsba.rgb.redComponent
firstColor.rgba.hsl.hsla.hsb.hsba.rgb.greenComponent
firstColor.rgba.hsl.hsla.hsb.hsba.rgb.blueComponent
