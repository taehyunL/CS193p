//
//  SetGame.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/04.
//

import Foundation

struct SetGame {
    private(set) var cards: [Card]
    
    init(numberOfCards: Int) {
        cards = []
        
        for pairOfCards in 0..<numberOfCards {
            cards.append(Card(id: pairOfCards))
        }
    }
    
    struct Card: Identifiable {
        var isChoosen: Bool = false
        var id: Int
    }
}

