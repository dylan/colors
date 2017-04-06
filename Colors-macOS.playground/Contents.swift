//: Playground - noun: a place where people can play

//import UIKit
import AppKit
import Colors

let a: CGFloat = 1.345
let b: Int = 1
let c: Double = 3.141521

let d = a / b
let e = c + b

let blue = NSColor.blue

MemoryLayout<NSColor>.size

class ColorTest {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
    init(){
        r = 0
        g = 0
        b = 0
        a = 0
    }
}

MemoryLayout<ColorTest>.size
import Accelerate

//let rgb = RGB(255, 0, 0)

let size = CGSize(width: 1, height: 1)
let point = CGPoint(x: 1.0, y: 1.0)
let rgbInt = RGB(0, 0, 0)

let green   = RGB(0, 1.0, 0)
let rgba    = RGBA(green)
let hsl     = HSL(green)
let hsla    = HSLA(green)
let hsb     = HSB(green)
let hsba    = HSBA(green)

green.red
green.green
green.blue

rgba.red
rgba.green
rgba.blue
rgba.alpha

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




