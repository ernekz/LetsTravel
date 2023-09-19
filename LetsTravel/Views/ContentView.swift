//
//  ContentView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("jwtToken") var userSession: String?
    @StateObject private var router = NavigationRouter()
    var body: some View {
        NavigationStack(path: $router.routes){
            if userSession != nil {
                VStack(spacing: 0.0){
                    NavigationBarBottom()
                }.navigationDestination(for: Route.self) { $0 }
            } else {
                LoginView()
            }
        }.environmentObject(router)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TabSelection())
    }
}
