//
//  Theme.swift
//  Assignment_2
//
//  Created by 이태현 on 2021/11/23.
//

import Foundation

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var color: String
    
    init(name: String, emojis: [String], numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.color = color
    }
}

