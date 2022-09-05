//
//  Theme_A6App.swift
//  Theme-A6
//
//  Created by user224517 on 9/3/22.
//

import SwiftUI

@main
struct Theme_A6App: App {
    @StateObject var store = ThemeStore(named: "Defaults")
    
    var body: some Scene {
        WindowGroup {
            ThemeChooserView().environmentObject(store)
        }
    }
}
