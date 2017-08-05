//
//  ColorView.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

#if os(macOS)
import AppKit
public typealias View    = NSView
public typealias OSColor = NSColor
public typealias Rect    = NSRect
#else
import UIKit
public typealias View    = UIView
public typealias OSColor = UIColor
public typealias Rect    = CGRect
#endif

public class ColorView: View {
    let colors: [Color]
    public init(colors: [Color]) {
        self.colors = colors
        let frameRect = Rect(x: 0, y: 0, width: colors.count * 24, height: 24)
        super.init(frame: frameRect)
    }

    public required init?(coder: NSCoder) {
        self.colors = [Color]()
        super.init(coder: coder)
    }

    public override func draw(_ dirtyRect: Rect) {
        for (i, color) in colors.enumerated() {
            let rect = Rect(x: i * 24, y: 0, width: 24, height: 24)
            #if os(macOS)
                color.NSColor.setFill()
                rect.fill()
            #else
                color.UIColor.setFill()
                UIRectFill(rect)
            #endif
        }
        super.draw(dirtyRect)
    }
}
