//
//  Color+Named.swift
//  Colors
//
//  Created by Dylan Wreggelsworth on 4/12/17.
//  Copyright © 2017 Colors. All rights reserved.
//

extension Color {

    // 0.0 white
    public static let black     = Color(hex: 0x000000)

    // 0.333 white
    public static let darkGray  = Color(red: 0.333, green: 0.333, blue: 0.333)

    // 0.667 white
    public static let lightGray = Color(red: 0.667, green: 0.667, blue: 0.667)

    // 1.0 white
    public static let white     = Color(hex: 0xffffff)

    // 0.5 white
    public static let gray      = Color(red: 0.5, green: 0.5, blue: 0.5)

    // 1.0, 0.0, 0.0 RGB
    public static let red       = Color(hex: 0xff0000)

    // 0.0, 1.0, 0.0 RGB
    public static let green     = Color(hex: 0x00ff00)

    // 0.0, 0.0, 1.0 RGB
    public static let blue      = Color(hex: 0x0000ff)

    // 0.0, 1.0, 1.0 RGB
    public static let cyan      = Color(hex: 0x00ffff)

    // 1.0, 1.0, 0.0 RGB
    public static let yellow    = Color(hex: 0xffff00)

    // 1.0, 0.0, 1.0 RGB
    public static let magenta   = Color(hex: 0xff00ff)

    // 1.0, 0.5, 0.0 RGB
    public static let orange    = Color(red: 1.0, green: 0.5, blue: 0)

    // 0.5, 0.0, 0.5 RGB
    public static let purple    = Color(red: 0.5, green: 0, blue: 0.5)

    // 0.6, 0.4, 0.2 RGB
    public static let brown     = Color(red: 0.6, green: 0.4, blue: 0.2)

    // 0.0 white, 0.0 alpha
    public static let clear     = Color(red: 0, green: 0, blue: 0, alpha:0)

    public static let all: [Color] = [
        .black,
        .darkGray,
        .lightGray,
        .white,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
        .clear
    ]
}
