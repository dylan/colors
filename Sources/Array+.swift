//
//  Array+.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/7/17.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation

extension Array {
    func asPairs() -> [(Iterator.Element, Iterator.Element)] {
        var result: [(Iterator.Element, Iterator.Element)] = []
        for (i, value) in self.enumerated() {
            if i < count - 1 {
                result.append((value, self[i + 1]))
            }
        }
        return result
    }
}
