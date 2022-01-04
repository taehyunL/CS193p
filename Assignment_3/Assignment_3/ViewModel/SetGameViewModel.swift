//
//  SetGameViewModel.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/04.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame = SetGame(numberOfCards: 14)
    
    var cards: Array<SetGame.Card> {
        model.cards
    }
}
