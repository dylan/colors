//
//  File.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/10/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

#if os(macOS)
    import AppKit

    public class ColorView: NSView {
        let colors: [Color]
        public init(colors: [Color]) {
            self.colors = colors
            let frameRect = NSRect(x: 0, y: 0, width: colors.count * 24, height: 24)
            super.init(frame: frameRect)
        }

        public required init?(coder: NSCoder) {
            self.colors = [Color]()
            super.init(coder: coder)
        }

        public override func draw(_ dirtyRect: NSRect) {
            for (i, color) in colors.enumerated() {
                let rect = NSRect(x: i * 24, y: 0, width: 24, height: 24)
                color.osColor.setFill()
                NSRectFill(rect)
            }
            super.draw(dirtyRect)
        }
    }
#endif

#if os(iOS)
    import UIKit

    public class ColorView: UIView {
        let colors: [Color]
        public init(colors: [Color]) {
            self.colors = colors
            let frameRect = CGRect(x: 0, y: 0, width: colors.count * 24, height: 24)
            super.init(frame: frameRect)
        }

        public required init?(coder: NSCoder) {
            self.colors = [Color]()
            super.init(coder: coder)
        }

        public override func draw(_ dirtyRect: CGRect) {
            for (i, color) in colors.enumerated() {
                let rect = CGRect(x: i * 24, y: 0, width: 24, height: 24)
                color.osColor.setFill()
                UIRectFill(rect)
            }
            super.draw(dirtyRect)
        }
    }
#endif
