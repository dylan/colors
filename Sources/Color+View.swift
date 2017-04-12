//
//  Color+View.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {

#if os(iOS) || os(macOS)

    /// Returns a `ColorView` that consists of a single 24x24 square of this `Color`.
    public var view: ColorView {
        return [self].view
    }

#endif
}
