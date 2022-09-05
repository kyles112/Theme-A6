//
//  Theme.swift
//  Theme-A6
//
//  Created by user224517 on 9/3/22.
//

import Foundation

struct Theme: Identifiable, Codable, Hashable {
    var name: String
    var emojis: String
    var themeColor: RGBAColor
    var numberOfPairsCards: Int?
    var id: Int
}

struct RGBAColor: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

