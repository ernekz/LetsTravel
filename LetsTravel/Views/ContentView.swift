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
    var body: some View {
        NavigationView{
            if userSession != nil {
                VStack(spacing: 0.0){
                    NavigationBarBottom()
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TabSelection())
    }
}
