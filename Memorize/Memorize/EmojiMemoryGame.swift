//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 이태현 on 2021/11/20.
//

//View Model
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🚲","🛵","🏍","🛺","🚔","🚍","🚡","🚠","🚟","🚃","🚞","🚄","🚈",
        "✈️","🛫","🛩","🚀","🛸","🚁","⛵️","🚤","🛥","🛳","🚢"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - intend(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
