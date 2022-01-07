//
//  SetGame.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/04.
//

import Foundation

struct SetGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private var chooseNumber: Int
    private var cardsIndex1: Int?
    private var cardsIndex2: Int?
    private var cardsIndex3: Int?
    private var cardsIndex: [Int]
    
    private(set) var deck: [Card]
    
    init(numberOfCards: Int, createCardcontent: (Int) -> CardContent) {
        cards = []
        chooseNumber = 0
        cardsIndex = []
        deck = []
        
        for pairIndex in 0..<numberOfCards {
            let content = createCardcontent(pairIndex)
            cards.append(Card(content: content, id: pairIndex))
        }
    }
    
    mutating func choose(_ card: Card) {
        cards[card.id].isChoosen.toggle()
        if card.isChoosen == false {
            chooseNumber += 1
            if chooseNumber == 1 {
                cardsIndex1 = card.id
                cardsIndex.append(cardsIndex1!)
            }
            else if chooseNumber == 2 {
                cardsIndex2 = card.id
                cardsIndex.append(cardsIndex2!)
            }
            else if chooseNumber == 3 {
                cardsIndex3 = card.id
                cardsIndex.append(cardsIndex3!)
                
                if cards[cardsIndex1!].content == cards[cardsIndex2!].content && cards[cardsIndex2!].content == cards[cardsIndex3!].content {
                    let sort = cardsIndex.sorted(by: > )
                    cards.remove(at: sort[0])
                    cards.remove(at: sort[1])
                    cards.remove(at: sort[2])
                    
                    for index in cards.indices {
                        cards[index].id = index
                    }
                } else {
                    for index in cards.indices {
                        if cards[index].isChoosen == true {
                            cards[index].isChoosen.toggle()
                        }
                    }
                }
                chooseNumber = 0
                cardsIndex = []
            }
        } else {
            chooseNumber -= 1
        }

    }
    
    struct Card: Identifiable {
        var isChoosen: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

