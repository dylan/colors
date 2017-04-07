//
//  File.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/7/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

public func ==<T: Color>(lhs: T, rhs: T) -> Bool {
    return lhs.argbHex == rhs.argbHex
}
