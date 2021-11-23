//
//  Assignment_2App.swift
//  Assignment_2
//
//  Created by 이태현 on 2021/11/23.
//

import SwiftUI

@main
struct Assignment_2App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
