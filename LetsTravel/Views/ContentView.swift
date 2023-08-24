//
//  ContentView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0.0){
            HeaderView()
            NavigationBarBottom()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
