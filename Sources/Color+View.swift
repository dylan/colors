//
//  Color+View.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Color {
    public var view: ColorView {
        return [self].view
    }
}
