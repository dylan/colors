//: Playground - noun: a place where people can play

import UIKit
import Colors


let firstColor = RGB.X11.lightGoldenrodYellow
let hsl        = HSL(firstColor)
let hsla       = HSLA(hsl)
let hsb        = HSB(hsla)
let hsba       = HSBA(hsb)

let white = RGB.CGA.white
//dump(white)

UIColor.green

let colors: [RGB] = [RGB.X11.lightGoldenrodYellow,
                     RGB.X11.lightGoldenrodYellow.hsl.rgb,
                     RGB.X11.lightGoldenrodYellow.hsla.rgb,
                     RGB.X11.lightGoldenrodYellow.hsba.rgb,
                     RGB.X11.lightGoldenrodYellow.hsb.rgb]
RGB.X11.lightGoldenrodYellow
RGB.X11.lightGoldenrodYellow.hsb
RGB.X11.lightGoldenrodYellow.hsb.hueComponent
RGB.X11.lightGoldenrodYellow.hsb.saturationComponent
RGB.X11.lightGoldenrodYellow.hsb.brightnessComponent
RGB.X11.lightGoldenrodYellow.hsb.rgb
colors.osColors()
colors.uiColors()
colors.view

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
