//: Playground - noun: a place where people can play

import AppKit
import Colors

let firstColor = RGB.X11.lightGoldenrodYellow
let hsl        = HSL(firstColor)
let hsla       = HSLA(hsl)
let hsb        = HSB(hsla)
let hsba       = HSBA(hsb)

let white = RGB.CGA.white

RGB.CGA.white == RGB.white

//dump(RGB.sample(from: RGB.X11.black, through: RGB.X11.red, at: 0.33))
//dump(HSL.sample(from: RGB.X11.black, through: RGB.X11.red, at: 0.33))
//dump(HSB.sample(from: RGB.X11.black, through: RGB.X11.red, at: 0.33))
//
//dump(RGB.CGA.cyan.sampleBetweenSelf(and: RGB.W3C.red, at: 0.5))
//dump(RGB.gradient(from: RGB.X11.red, through: RGB.X11.black, steps: 4))

let colors: [RGB] = [RGB.W3C.green, hsl.rgb, hsla.rgb, hsb.rgb, hsba.rgb]

//dump(RGB.gradient(from: [RGB.CGA.black, RGB.X11.white, RGB.CGA.black], steps: 5))
//(Int(1.0 * 255) << 16) + (Int(1.0 * 255) << 8) + (Int(1.0 * 255)) + (Int(1.0 * 255) << 24)

//RGB.white.toHex()

let v1 = 0xffffff
RGB.X11.white.rgbHex == RGB(v1).rgbHex

let v = 0xff00ffff
RGBA(0, 255, 255, 255).argbHex == RGBA(v).argbHex

class PaletteView: NSView {
    let colors: [Color]
    init(colors: [Color]) {
        self.colors = colors
        let frameRect = NSRect(x: 0, y: 0, width: colors.count * 24, height: 24)
        super.init(frame: frameRect)
    }
    required init?(coder: NSCoder) {
        self.colors = [Color]()
        super.init(coder: coder)
    }
    override func draw(_ dirtyRect: NSRect) {
        for (i, color) in colors.enumerated() {
            let rect = NSRect(x: i * 24, y: 0, width: 24, height: 24)
            color.osColor.setFill()
            NSRectFill(rect)
        }
        super.draw(dirtyRect)
    }
}

let testValue: [Color] = [RGB.CGA.black, RGB.CGA.magenta, RGB.CGA.brown.hsla, RGB(50, 255, 0), RGB.CGA.white]

let testLength = 16

PaletteView(colors: RGB.spread(colors: testValue, to: testLength))
PaletteView(colors: RGBA.spread(colors: testValue, to: testLength))
PaletteView(colors: HSB.spread(colors: testValue, to: testLength))
PaletteView(colors: HSBA.spread(colors: testValue, to: testLength))
PaletteView(colors: HSL.spread(colors: testValue, to: testLength))

//
//firstColor.rgba.redComponent
//firstColor.rgba.greenComponent
//firstColor.rgba.blueComponent
//firstColor.rgba.alphaComponent
//
//hsl.hueComponent
//hsl.saturationComponent
//hsl.lightnessComponent
//
//hsla.hueComponent
//hsla.saturationComponent
//hsla.lightnessComponent
//hsla.alphaComponent
//
//hsb.hueComponent
//hsb.saturationComponent
//hsb.brightnessComponent
//
//hsba.hueComponent
//hsba.saturationComponent
//hsba.brightnessComponent
//hsba.alphaComponent
//
//firstColor.rgba.redComponent
//firstColor.rgba.greenComponent
//firstColor.rgba.blueComponent
//firstColor.rgba.alphaComponent
//
//firstColor.rgba.hsl.hueComponent
//firstColor.rgba.hsl.saturationComponent
//firstColor.rgba.hsl.lightnessComponent
//
//firstColor.rgba.hsl.hsla.hueComponent
//firstColor.rgba.hsl.hsla.saturationComponent
//firstColor.rgba.hsl.hsla.lightnessComponent
//
//firstColor.rgba.hsl.hsla.hsb.hueComponent
//firstColor.rgba.hsl.hsla.hsb.saturationComponent
//firstColor.rgba.hsl.hsla.hsb.brightnessComponent
//
//firstColor.rgba.hsl.hsla.hsb.rgb.redComponent
//firstColor.rgba.hsl.hsla.hsb.rgb.greenComponent
//firstColor.rgba.hsl.hsla.hsb.rgb.blueComponent
//
//firstColor.rgba.hsl.hsla.hsb.hueComponent
//firstColor.rgba.hsl.hsla.hsb.saturationComponent
//firstColor.rgba.hsl.hsla.hsb.brightnessComponent
//
//firstColor.rgba.hsl.hsla.hsb.hsba
//firstColor.rgba.hsl.hsla.hsb.hsba.saturationComponent
//firstColor.rgba.hsl.hsla.hsb.hsba.brightnessComponent
//firstColor.rgba.hsl.hsla.hsb.hsba.alphaComponent
//
//firstColor.rgba.hsl.hsla.hsb.hsba.rgb.redComponent
//firstColor.rgba.hsl.hsla.hsb.hsba.rgb.greenComponent
//firstColor.rgba.hsl.hsla.hsb.hsba.rgb.blueComponent
