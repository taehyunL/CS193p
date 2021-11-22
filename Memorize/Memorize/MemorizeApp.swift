//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 이태현 on 2021/11/12.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
