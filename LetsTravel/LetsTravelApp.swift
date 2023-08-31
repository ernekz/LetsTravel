//
//  LetsTravelApp.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import SwiftUI

@main
struct LetsTravelApp: App {
    @StateObject private var tabSelection = TabSelection()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tabSelection)
        }
    }
}
