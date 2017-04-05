//
//  Color+UIColor.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/5/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: NumericValue, green: NumericValue, blue: NumericValue, alpha: NumericValue) {
        self.init(red: red.cgFloat, green: green.cgFloat, blue: blue.cgFloat, alpha: alpha.cgFloat)
    }
}

extension Color {
    #if os(iOS) || os(tvOS) || os(watchOS)
    public var uiColor: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    public var osColor: UIColor {
        return uiColor
    }
    #endif
}
