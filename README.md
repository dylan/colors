# Colors
[![License](https://img.shields.io/cocoapods/l/Colors.svg?style=flat)](https://github.com/dylan/Colors/blob/master/LICENSE)
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


## Installation

### Carthage
```Ruby
github "dylan/colors"
```

### Cocoapods
Not supported. It's too convoluted.

## Usage

```Swift
let color1 = Color(red: 1.0, green: 1.0, blue: 1.0)

let color2 = Color(redUInt: 255, greenUInt: 255, blueUInt: 255)

let color3 = Color(rgb: 0xffffff)

let color4 = Color(argb: 0xffffffff)

color1 == color2 // true
color2 == color3 // true
color3 == color4 // true

var dinerGreen = Color(rgb: 0x37ecbd)

dinerGreen.hue           // 164.4199
dinerGreen.hslSaturation // 0.826484
dinerGreen.hslLightness  // 0.5705882

dinerGreen.red   // 0.2156863
dinerGreen.green // 0.9254902
dinerGreen.blue  // 0.7411765
dinerGreen.alpha // 1

dinerGreen.argbValue  // 4281855165
dinerGreen.argbString // "#ff37ecbd"

dinerGreen.rgbValue  // 36650585
dinerGreen.rgbString // "#37ecbd"

Color.white.argbString // "#ffffffff"
Color.white.rgbString  // "#ffffff"

0xffffff == Color.white.rgbValue // true

dinerGreen.hueShifted(45).view  // On iOS a UIView with a soft blue square.
```
