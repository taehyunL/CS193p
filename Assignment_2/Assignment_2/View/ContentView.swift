//
//  ContentView.swift
//  Assignment_2
//
//  Created by 이태현 on 2021/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.themeName).font(.largeTitle)
                Spacer()
                Text(String(viewModel.score)).font(.largeTitle)
            }
            .padding(.horizontal)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(viewModel.themeColor)
                .padding(.horizontal)
            }
            Button {
                viewModel.newGame()
            } label: {
                Text("New Game")
            }
        }
    }

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }

    }
}


    

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        }
    }
}
