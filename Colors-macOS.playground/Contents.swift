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
dinerGreen.saturation
dinerGreen.lightness

dinerGreen.red
dinerGreen.green
dinerGreen.blue
dinerGreen.alpha

func spin(_ color: Color, amount: Degree) -> Color {
    var result = color
    result.hue += amount
    return result
}

let spunValue = spin(dinerGreen, amount: 15)
spunValue.hue

spunValue.red
spunValue.green
spunValue.blue

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



