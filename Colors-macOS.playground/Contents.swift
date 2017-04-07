//: Playground - noun: a place where people can play

import AppKit
import Colors

let firstColor = RGB.X11.lightGoldenrodYellow
let hsl        = HSL(firstColor)
let hsla       = HSLA(hsl)
let hsb        = HSB(hsla)
let hsba       = HSBA(hsb)

let white = RGB.CGA.white
//dump(white)


let gradientColors: [RGB] = [RGB.X11.black, RGB.X11.white]

dump(RGB.lerpedColor(from: RGB.X11.black, through: RGB.X11.white.hsb, at: 0.5))

let colors: [RGB] = [RGB.W3C.green, hsl.rgb, hsla.rgb, hsb.rgb, hsba.rgb]
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
