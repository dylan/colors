//: Playground - noun: a place where people can play

import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redUInt: 255, greenUInt: 255, blueUInt: 255)

let color3 = Color(rgb: 0xffffff)

let color4 = Color(argb: 0xffffffff)

color1 == color2
color2 == color3
color3 == color4

let dinerGreen = Color(rgb: 0x37ecbd)

dinerGreen.view

dinerGreen.hue
dinerGreen.hslSaturation
dinerGreen.hslLightness

dinerGreen.hue
dinerGreen.hsbSaturation
dinerGreen.hsbBrightness

dinerGreen.red
dinerGreen.green
dinerGreen.blue
dinerGreen.alpha



