//: Playground - noun: a place where people can play

import Darwin
import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redInt: 255, greenInt: 255, blueInt: 255)

let color3 = Color(hex: 0xffffff)
color3.rgb
color3.lab
color3.xyz
color3.hsl
color3.hsv
color3.cmyk

color1 == color2
color2 == color3

var dinerGreen = Color(hex: 0x37ecbd)

dinerGreen.rgb
dinerGreen.hsl
dinerGreen.hsv
dinerGreen.cmyk
dinerGreen.xyz
dinerGreen.lab

dinerGreen.hex
dinerGreen.hexString

Color.white.hexString

Color.red.luminance
dinerGreen.luminance

0xffffff == Color.white.hex

dinerGreen.hueShifted(180).view
dinerGreen.lightened(0.5).view
dinerGreen.darkened(0.5).view
dinerGreen.saturated(1.0).view
dinerGreen.desaturated(1.0).view

dinerGreen.view
dinerGreen.hsv.saturation = 0

dinerGreen.view

Color.blue.mixed(with: .red, percent: 0.5).view

let ramp = [Color(hex: 0x000000), // Black
            Color(hex: 0xff0000), // Red
            Color(hex: 0x00ff00), // Green
            Color(hex: 0x0000ff), // Blue
            Color(hex: 0x000000), // Black
            Color(hex: 0xffffff)] // White

ramp.spread(to: 16, using: .hue).view

ramp.spread(to: 16, using: .rgb).view

let sexyRamp = [Color(hex: 0xde6161),
                Color(hex: 0x2657eb)]

sexyRamp.spread(to: 16, using: .rgb).view

sexyRamp.spread(to: 16, using: .hue).view
[Color.red, Color.blue].spread(to: 8).view
[Color.red, Color.blue].spread(to: 8, using: .rgb).view

let x11ColorRamp: [Color] = [X11.green, X11.lightBlue, X11.beige, X11.chartreuse, X11.darkOliveGreen, X11.purple]
x11ColorRamp.view

let w3cColorRamp: [Color] = [W3C.green, W3C.lightblue, W3C.beige, W3C.chartreuse, W3C.darkolivegreen, W3C.purple]
w3cColorRamp.view

let namedColorRamp: [Color] = [.black, .darkGray, .lightGray, .white, .gray, .red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
namedColorRamp.view

Resene.copperFire.hexString
XKCD.acidgreen.hexString
XKCD.almostblack.view
X11.all.count
