//
//  Color+Hex.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/12/17.
//  Copyright © 2017 Colors. All rights reserved.
//

extension Color {
    public var argbValue: Hex {
        return (Hex(self.alpha * 0xff) << 24) +
               (Hex(self.red   * 0xff) << 16) +
               (Hex(self.green * 0xff) << 8)  +
               (Hex(self.blue  * 0xff))
    }
    public var rgbValue: Hex {
        return (Hex(self.red   * 0xff) << 16) +
               (Hex(self.green * 0xff) << 8)  +
               (Hex(self.blue  * 0xff))
    }

    public var argbString: String {
        return String(format: "#%02lx%02lx%02lx%02lx",
            Hex(self.alpha * 0xff000000) >> 24,
            Hex(self.red   * 0x00ff0000) >> 16,
            Hex(self.green * 0x0000ff00) >> 8,
            Hex(self.blue  * 0x000000ff))
    }

    public var rgbString: String {
        return String(format: "#%02lx%02lx%02lx",
            Hex(self.red   * 0xff0000) >> 16,
            Hex(self.green * 0x00ff00) >> 8,
            Hex(self.blue  * 0x0000ff))
    }
}
