//
//  SetGame.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/04.
//

import Foundation

struct SetGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var cnt = 0
    
    init(numberOfCards: Int, createCardcontent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfCards {
            let content = createCardcontent(pairIndex)
            cards.append(Card(content: content, id: pairIndex))
        }
    }
    
    mutating func choose(_ card: Card) {
        cards[card.id].isChoosen = !cards[card.id].isChoosen
        cards.remove(at: card.id)
    }
    
    struct Card: Identifiable {
        var isChoosen: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

