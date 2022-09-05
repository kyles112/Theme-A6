//
//  ThemeChooserView.swift
//  Theme-A6
//
//  Created by user224517 on 9/3/22.
//

import SwiftUI

struct ThemeChooserView: View {
    var emojiFontSize: CGFloat = 40
    var emojiFont: Font { .system(size: emojiFontSize) }
    
    @EnvironmentObject var store: ThemeStore
    
    var body: some View {
        let theme = store.theme(at: 0)
        VStack {
            Text(theme.name)
            EmojiView(emojis: theme.emojis)
                .font(emojiFont)
        }
    }
}

struct EmojiView: View {
    let emojis: String
    
    var body: some View {
        HStack {
            ForEach(emojis.removingDuplicateCharacters.map { String($0) }, id: \.self) { emoji in
                Text(emoji)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    @StateObject var store = ThemeStore(named: "Defaults")
//
//    static var previews: some View {
//        ThemeChooserView.environmentObject(store)
//    }
//}
