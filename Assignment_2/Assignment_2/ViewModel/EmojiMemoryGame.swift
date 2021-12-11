//
//  EmojiMemoryGame.swift
//  Assignment_2
//
//  Created by 이태현 on 2021/11/23.
//

import SwiftUI
//Color정보포함, 따라서 Foundation 사용불가

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!//동일한 클래스에 있더라도 static 변수가 선언된 클래스 이름을 명시해줘야함
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚗","🚕","🚙","🚑","🚒","🚐","🛻","🚚","🚛","🚜"],
            numberOfPairsOfCards: 8,
            color: "Green"
        ),
        Theme(
            name: "Weathers",
            emojis: ["☀︎","☾","☽","☔︎","☃︎","☼","☁︎","☂︎"],
            numberOfPairsOfCards: 6,
            color: "Red"
        ),
        Theme(
            name: "Hearts",
            emojis: ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","❤️‍🔥","❤️‍🩹","❣️"],
            numberOfPairsOfCards: 10,
            color: "Blue"
        ),
        Theme(
            name: "Balls",
            emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🪀"],
            numberOfPairsOfCards: 3,
            color: "Black"
        ),
        Theme(
            name: "Fruits",
            emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🥝","🍍","🥭","🥑"],
            numberOfPairsOfCards: 12,
            color: "Pink"
        ),
        Theme(
            name: "Animals",
            emojis: ["🐶","🐱","🐭","🐹","🐰"],
            numberOfPairsOfCards: 3,
            color: "Gray")
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }

    var themeName: String {
        return theme.name
    }
    
    var themeColor: Color {
        switch theme.color {
        case "Green":
            return .green
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Black":
            return .black
        case "Pink":
            return .pink
        case "Gray":
            return .gray
        default:
            return .brown
        }
    }
    
    var score: Int {
        model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choosen(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    
}

