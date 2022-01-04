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
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isChoosen == true && card.isMatched == false {
                CardView(card: card)
                    .foregroundColor(.blue)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                        print("check true")
                    }
            } else if card.isChoosen == false && card.isMatched == false {
                CardView(card: card)
                    .foregroundColor(.red)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                        print("check false")
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    var card: SetGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
//                Rhombus(geometry: geometry)
    //            Text(card.content) 여기에 카드 content 추가
    //            shape.opacity(0) 투명도 설정하기

            }
        }
    }
}

struct Rhombus: View {
    var geometry: GeometryProxy
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
            path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height))
            path.addLine(to: CGPoint(x: 0, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: geometry.size.width / 2, y: 0))
        }
        .fill(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        
        ContentView(game: game)
    }
}
