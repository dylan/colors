//: Playground - noun: a place where people can play

import Darwin
import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redInt: 255, greenInt: 255, blueInt: 255)

let color3 = Color(hex: 0xffffff)

color1 == color2
color2 == color3

var dinerGreen = Color(hex: 0x36ecbd)

dinerGreen.hsl

dinerGreen.rgb

dinerGreen.hex
dinerGreen.hexString

Color.white.hexString

Color.red.luminance
dinerGreen.luminance

0xffffff == Color.white.hex

dinerGreen.hueShifted(180).view
dinerGreen.lightened(0.3).view
dinerGreen.darkened(0.3).view
dinerGreen.saturated(1.0).view
dinerGreen.desaturated(1.0).view

dinerGreen.view
dinerGreen.hsv.saturation = 0

dinerGreen.view

dinerGreen.mixed(with: .red, percent: 0.5).view

let ramp = [Color(hex: 0x000000), // Black
            Color(hex: 0xff0000), // Red
            Color(hex: 0x00ff00), // Green
            Color(hex: 0x0000ff), // Blue
            Color(hex: 0x000000), // Black
            Color(hex: 0xffffff)] // White

[Color.red, Color.blue].spread(to: 8).view
[Color.red, Color.blue].spread(to: 8, using: .rgb).view

ramp.spread(to: 32, using: .hue).view

ramp.spread(to: 32, using: .rgb).view

let sexyRamp = [Color(hex: 0xde6161),
                Color(hex: 0x2657eb)]

sexyRamp.spread(to: 16, using: .rgb).view

sexyRamp.spread(to: 16, using: .hue).view

let x11ColorRamp: [Color] = [X11.green, X11.lightBlue, X11.beige, X11.chartreuse, X11.darkOliveGreen, X11.purple]
x11ColorRamp.view

let w3cColorRamp: [Color] = [W3C.green, W3C.lightblue, W3C.beige, W3C.chartreuse, W3C.darkolivegreen, W3C.purple]
w3cColorRamp.view

let namedColorRamp: [Color] = [.black, .white, .brown, .cyan, .green]
namedColorRamp.view

let lastThirtyTwo = (Resene.all.count - 32)
Array(Resene.all.dropLast(lastThirtyTwo)).view

let view = Array(Resene.all
    .sorted(by:{ (a, b) -> Bool in
        return a.hsl.hue < b.hsl.hue && a.hsl.saturation < b.hsl.saturation && a.hsl.luminosity < b.hsl.luminosity
    })
    .dropLast(lastThirtyTwo - 32))
    .view

view

//
//import AppKit
//
//extension Array where Element == Color {
//    var nsColorList: NSColorList {
//        let nsColors = self.map({ return $0.NSColor })
//        var list = NSColorList(name: "")
//        for (i, color) in self.enumerated() {
//            list.insertColor(color.NSColor, key: color.hexString, at: i)
//        }
//        return list
//    }
//}
//
//namedColorRamp.nsColorList

