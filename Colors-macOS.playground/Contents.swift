//: Playground - noun: a place where people can play

//import UIKit
import AppKit
import Colors

let a: CGFloat = 1.345
let b: Int = 1
let c: Double = 3.141521

let d = a / b
let e = c + b

//let rgb = RGB(255, 0, 0)
let rgb = RGB(0, 1.0, 0)
let hsl = HSL(rgb)
let rgb2 = RGB(hsl)

rgb.red
rgb.green
rgb.blue

hsl.hue
hsl.saturation
hsl.lightness

rgb2.red
rgb2.green
rgb2.blue

