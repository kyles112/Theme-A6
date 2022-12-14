//
//  ThemeStore.swift
//  Theme-A6
//
//  Created by user224517 on 9/3/22.
//

import SwiftUI
	
class ThemeStore: ObservableObject {
    let name: String
    
    @Published var themes = [Theme]() {
        didSet {
            storeInUserDefaults()
        }
    }
    
    private var userDefaultsKey: String {
        "ThemeStore:" + name
    }
    
    private func storeInUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(themes), forKey: userDefaultsKey)
    }
    
    private func restoreFromUserDefaults() {
        print("Attemping to restore from defaults")
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedThemes = try? JSONDecoder().decode(Array<Theme>.self, from: jsonData) {
            themes = decodedThemes
            print(themes)
        }
    }
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if themes.isEmpty {
            print("Themse were empty and insert 4 default themes")
            insertTheme(named: "Vehicles",
                        emojis: "ππππππππ»πππππππβοΈπ«π¬π©ππΈπ²ππΆβ΅οΈπ€π₯π³β΄π’ππππππππΊπ",
                        themeColor: RGBAColor(color: .red),
                        numberOfPairsCards: 8
                    )
            insertTheme(named: "Sports",
                        emojis: "πβΎοΈπβ½οΈπΎππ₯πβ³οΈπ₯π₯πβ·π³",
                        themeColor: RGBAColor(color: .blue),
                        numberOfPairsCards: 6
            )
            insertTheme(named: "Music",
                        emojis: "πΌπ€πΉπͺπ₯πΊπͺπͺπ»",
                        themeColor: RGBAColor(color: .green),
                        numberOfPairsCards: 5
            )
            insertTheme(named: "Animals",
                        emojis: "π₯π£πππππππ¦ππππππ¦π¦π¦π¦π’ππ¦π¦π¦πππ¦π¦π¦§π¦£ππ¦π¦πͺπ«π¦π¦",
                        themeColor: RGBAColor(color: .gray),
                        numberOfPairsCards: 10
            )
        }
    }
    
    // MARK: - Intent
    
    func theme(at index: Int) -> Theme {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(named name: String, emojis: String? = nil, themeColor: RGBAColor, numberOfPairsCards: Int,  at index: Int = 0) {
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let theme = Theme(name: name, emojis: emojis ?? "", themeColor: themeColor, numberOfPairsCards: numberOfPairsCards , id: unique)
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
    }
}

