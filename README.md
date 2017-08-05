# Colors
[![License](https://img.shields.io/cocoapods/l/Colors.svg?style=flat)](https://github.com/dylan/Colors/blob/master/LICENSE)
![Swift](https://img.shields.io/badge/%20in-swift%204.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


## Installation

### Carthage
```Ruby
github "dylan/colors"
```

### Cocoapods
Not supported. It's too convoluted.

## Coming Soon...
- Perceptual functions - What colors can work when viewed with other's and in certain situations?
- Harmonic functions - Inverse, Triadic, Analogous, etc.


## Usage

```Swift
import Colors

let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redInt: 255, greenInt: 255, blueInt: 255)

let color3 = Color(hex: 0xffffff)


color1 == color2 // true
color2 == color3 // true


var dinerGreen = Color(hex: 0x37ecbd)

dinerGreen.hsl.hue        // 164.4199
dinerGreen.hsl.saturation // 0.826484
dinerGreen.hsl.lightness  // 0.5705882

dinerGreen.rgb.red   // 0.2156863
dinerGreen.rgb.green // 0.9254902
dinerGreen.rgb.blue  // 0.7411765

dinerGreen.hex       // 4281855165
dinerGreen.hexString // "#37ecbd"

dinerGreen.hueShifted(45).view  // On iOS/Mac a View with a soft blue square.


/// Colors also has a few color lists available...

Resene.copperFire // #915345

XKCD.acidgreen    // #8ffe09

X11.all.count     // 140
```
