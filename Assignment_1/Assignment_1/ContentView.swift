//
//  ContentView.swift
//  Assignment_1
//
//  Created by ์ดํํ on 2021/11/17.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["๐","๐","๐","๐","๐","๐","๐","โ๏ธ",
                  "๐ด","๐ฒ","๐ต","๐","๐บ","๐ ","๐","๐ฉ"]
    
    let vehicleEmojis = ["๐","๐","๐","๐","๐","๐","๐ป","๐","๐","๐"]
    let weatherEmojis = ["โ๏ธ","โพ","โฝ","โ๏ธ","โ๏ธ","โผ","โ๏ธ","โ๏ธ"]
    let heartEmojis = ["โค๏ธ","๐งก","๐","๐","๐","๐","๐ค","๐ค","โค๏ธโ๐ฅ","โค๏ธโ๐ฉน","โฃ๏ธ"]
    
    var body: some View {
        ZStack {
            VStack {
                Text("Memorize!")
                    .font(.largeTitle)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                        ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                HStack {
                    vehicle
                    Spacer()
                    weather
                    Spacer()
                    heart
                }
                .padding(.horizontal)
            }
           
        }
    }
    
    var vehicle: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("vehicle")
            }
        }
    }
    
    var weather: some View {
        Button {
            emojis = weatherEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "sun.min")
                    .font(.largeTitle)
                Text("weather")
            }
        }
    }
    
    var heart: some View {
        Button {
            emojis = heartEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                Text("heart")
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp = true
    var content: String
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
