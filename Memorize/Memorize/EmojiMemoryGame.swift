//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 이태현 on 2021/11/20.
//

//View Model
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis = ["🚲","🛵","🏍","🛺","🚔","🚍","🚡","🚠","🚟","🚃","🚞","🚄","🚈",
        "✈️","🛫","🛩","🚀","🛸","🚁","⛵️","🚤","🛥","🛳","🚢"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }

    // MARK: - intend(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
