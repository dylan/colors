//: Playground - noun: a place where people can play

import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redUInt: 255, greenUInt: 255, blueUInt: 255)

let color3 = Color(rgb: 0xffffff)

let color4 = Color(argb: 0xffffffff)

color1 == color2
color2 == color3
color3 == color4

var dinerGreen = Color(rgb: 0x37ecbd)

dinerGreen.hue
dinerGreen.hslSaturation
dinerGreen.hslLightness

dinerGreen.red
dinerGreen.green
dinerGreen.blue
dinerGreen.alpha

shiftHue(of: dinerGreen, degrees: 45).view
lighten(dinerGreen, percent: 0.3).view
darken(dinerGreen, percent: 0.3).view
saturate(dinerGreen, percent: 1.0).view
desaturate(dinerGreen, percent: 1.0).view
mix(dinerGreen, with: .red, percent: 0.5).view

let ramp = [Color(rgb: 0x000000),
            Color(rgb: 0xff0000),
            Color(rgb: 0x00ff00),
            Color(rgb: 0x0000ff),
            Color(rgb: 0x000000),
            Color(rgb: 0xffffff)]

ramp.spread(to: 32, using: .hue).view

ramp.spread(to: 32, using: .rgb).view

let sexyRamp = [Color(rgb: 0xde6161),
                Color(rgb: 0x2657eb)]

sexyRamp.spread(to: 16, using: .rgb).view

sexyRamp.spread(to: 16, using: .hue).view

let x11ColorRamp: [Color] = [X11.green, X11.lightBlue, X11.beige, X11.chartreuse, X11.darkOliveGreen, X11.purple]
x11ColorRamp.view

let w3cColorRamp: [Color] = [W3C.green, W3C.lightblue, W3C.beige, W3C.chartreuse, W3C.darkolivegreen, W3C.purple]
w3cColorRamp.view

let namedColorRamp: [Color] = [.black, .white, .brown, .cyan, .green]
namedColorRamp.view

