//
//  SetGameViewModel.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/04.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    typealias Card = SetGame<String>.Card
    
    static var emojis = ["🚲","🛵","🏍","🛺","🚲","🛵","🏍","🛺","🚲","🛵","🏍","🛺"].shuffled()
    
    @Published private var model = createSetGame()
    
    private static func createSetGame() -> SetGame<String> {
        SetGame<String>(numberOfCards: Int.random(in: 0..<13)) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    var cards: Array<Card> {
        model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = SetGameViewModel.createSetGame()
        SetGameViewModel.emojis.shuffle()
    }
    
    func moreCardDeck() {
        
    }
}
