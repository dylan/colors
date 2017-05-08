//: Playground - noun: a place where people can play

import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redInt: 255, greenInt: 255, blueInt: 255)

let color3 = Color(hex: 0xffffff)

color1 == color2
color2 == color3

let dinerGreen = Color(hex: 0x37ecbd)

dinerGreen.view

dinerGreen.hsl

dinerGreen.hsv

dinerGreen.rgb
