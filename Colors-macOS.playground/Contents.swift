//: Playground - noun: a place where people can play

import Darwin
import Colors

//let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)
//
//let color2 = Color(redUInt: 255, greenUInt: 255, blueUInt: 255)
//
//let color3 = Color(rgb: 0xffffff)
//
//let color4 = Color(argb: 0xffffffff)
//
//color1 == color2
//color2 == color3
//color3 == color4
//
var dinerGreen = Color(rgb: 0x37ecbd)
//
//dinerGreen.hue
//dinerGreen.hslSaturation
//dinerGreen.hslLightness
//
//dinerGreen.red
//dinerGreen.green
//dinerGreen.blue
//dinerGreen.alpha
//
//dinerGreen.argbValue
//dinerGreen.argbString
//
//dinerGreen.rgbValue
//dinerGreen.rgbString
//
//Color.white.argbString
//Color.white.rgbString
//
//Color.red.luminance
//dinerGreen.luminance
//
//0xffffff == Color.white.rgbValue
//
//Color(rgb: 0xffffff).argbString
//
//dinerGreen.hueShifted(45).view
//dinerGreen.lightened(0.3).view
//dinerGreen.darkened(0.3).view
//dinerGreen.saturated(1.0).view
//dinerGreen.desaturated(1.0).view
//
//dinerGreen.view
////dinerGreen.hsbSaturation = 0
//
//dinerGreen.view
//
//dinerGreen.mixed(with: .red, percent: 0.5).view
//


//
//dinerGreen.view
//
//dinerGreen.red
//dinerGreen.green
//dinerGreen.blue
//
//dinerGreen.hue
//dinerGreen.hsbSaturation
//dinerGreen.hsbBrightness
//
//dinerGreen.hue
//dinerGreen.hslSaturation
//dinerGreen.hslLightness

//dinerGreen.red
//dinerGreen.green
//dinerGreen.blue
//
dinerGreen.hue
dinerGreen.hslSaturation
dinerGreen.hslLightness

dinerGreen.hue
dinerGreen.hsbSaturation
dinerGreen.hsbBrightness

let test1 = Color(hue: dinerGreen.hue, saturation: dinerGreen.hslSaturation, lightness: dinerGreen.hslLightness)
let test2 = Color(hue: dinerGreen.hue, saturation: dinerGreen.hsbSaturation, brightness: dinerGreen.hsbBrightness)

dinerGreen.hue
test1.hue
test2.hue

dinerGreen.hslSaturation
test1.hslSaturation
test2.hslSaturation

dinerGreen.hslLightness
test1.hslLightness
test2.hslLightness

dinerGreen.hsbSaturation
test1.hsbSaturation
test2.hsbSaturation

dinerGreen.hsbBrightness
test1.hsbBrightness
test2.hsbBrightness

dinerGreen.red
test1.red
test2.red

dinerGreen.green * 255
test1.green
test2.green

dinerGreen.blue * 255
test1.blue
test2.blue

test1.view
test2.view


//let ramp = [Color(rgb: 0x000000),
//            Color(rgb: 0xff0000),
//            Color(rgb: 0x00ff00),
//            Color(rgb: 0x0000ff),
//            Color(rgb: 0x000000),
//            Color(rgb: 0xffffff)]
//
//ramp.spread(to: 32, using: .hue).view
//
//ramp.spread(to: 32, using: .rgb).view
//
//let sexyRamp = [Color(rgb: 0xde6161),
//                Color(rgb: 0x2657eb)]
//
//sexyRamp.spread(to: 16, using: .rgb).view
//
//sexyRamp.spread(to: 16, using: .hue).view
//
//let x11ColorRamp: [Color] = [X11.green, X11.lightBlue, X11.beige, X11.chartreuse, X11.darkOliveGreen, X11.purple]
//x11ColorRamp.view
//
//let w3cColorRamp: [Color] = [W3C.green, W3C.lightblue, W3C.beige, W3C.chartreuse, W3C.darkolivegreen, W3C.purple]
//w3cColorRamp.view
//
//let namedColorRamp: [Color] = [.black, .white, .brown, .cyan, .green]
//namedColorRamp.view
//
//import AppKit
//
//extension Array where Element == Color {
//    var nsColorList: NSColorList {
//        let nsColors = self.map({ return $0.NSColor })
//        var list = NSColorList(name: "")
//        for (i, color) in self.enumerated() {
//            list.insertColor(color.NSColor, key: color.rgbString, at: i)
//        }
//        return list
//    }
//}
//
////namedColorRamp.nsColorList.
//
