//: Playground - noun: a place where people can play

//import UIKit
import AppKit
import Colors

let rgbInt = RGB(0, 0, 0)

let green = RGB(0, 255, 0)
let hsl   = HSL(green)
let hsla  = HSLA(hsl)
let hsb   = HSB(hsla)
let hsba  = HSBA(hsb)

let colors: [Color] = [green, hsl, hsla, hsb, hsba]
colors.osColors()
colors.nsColors()

green.rgba.red
green.rgba.green
green.rgba.blue
green.rgba.alpha

hsl.hue
hsl.saturation
hsl.lightness

hsla.hue
hsla.saturation
hsla.lightness
hsla.alpha

hsb.hue
hsb.saturation
hsb.brightness

hsba.hue
hsba.saturation
hsba.brightness
hsba.alpha

green.rgba.red
green.rgba.green
green.rgba.blue
green.rgba.alpha

green.rgba.hsl.hue
green.rgba.hsl.saturation
green.rgba.hsl.lightness

green.rgba.hsl.hsla.hue
green.rgba.hsl.hsla.saturation
green.rgba.hsl.hsla.lightness

green.rgba.hsl.hsla.hsb.hue
green.rgba.hsl.hsla.hsb.saturation
green.rgba.hsl.hsla.hsb.brightness

green.rgba.hsl.hsla.hsb.rgb.red
green.rgba.hsl.hsla.hsb.rgb.green
green.rgba.hsl.hsla.hsb.rgb.blue

green.rgba.hsl.hsla.hsb.hue
green.rgba.hsl.hsla.hsb.saturation
green.rgba.hsl.hsla.hsb.brightness

green.rgba.hsl.hsla.hsb.hsba.hue
green.rgba.hsl.hsla.hsb.hsba.saturation
green.rgba.hsl.hsla.hsb.hsba.brightness
green.rgba.hsl.hsla.hsb.hsba.alpha

green.rgba.hsl.hsla.hsb.hsba.rgb.red
green.rgba.hsl.hsla.hsb.hsba.rgb.green
green.rgba.hsl.hsla.hsb.hsba.rgb.blue
