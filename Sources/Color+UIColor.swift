//
//  Color+UIColor.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/11/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

extension Color {

    /// A `UIColor` representation of `Self`.
    public var UIColor: UIKit.UIColor {
        return UIKit.UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}
#endif
