//
//  ContentView.swift
//  Assignment_3
//
//  Created by 이태현 on 2022/01/02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
//            Text(card.content) 여기에 카드 content 추가
//            shape.opacity(0) 투명도 설정하기 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        
        ContentView(game: game)
    }
}
