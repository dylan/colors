//
//  ColorsTests.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on {TODAY}.
//  Copyright © 2017 Colors. All rights reserved.
//

import Foundation
import XCTest
import Colors

class ColorsTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(Colors().text, "Hello, World!")
    }

    func test_Issue_GitHub19() {
        let colorHSV = Color(hue: 0.0, saturation: 0.0, value: 100.0)
        let colorConvertedHSL = colorHSV.converted(to: .hsl)
        XCTAssert(colorConvertedHSL.hsl.saturation.isNaN == false)
    }

}

#if os(Linux)
extension ColorsTests {
    static var allTests : [(String, (ColorsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
