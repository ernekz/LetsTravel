//
//  NavigationBarBottom.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct NavigationBarBottom: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject private var tabSelection: TabSelection
    var body: some View{
        TabView(selection: $tabSelection.selectedTab) {
            
            HomeView()
                .tag(0)
                .tabItem(){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            CreateView()
                .tag(1)
                .tabItem(){
                    Image(systemName: "plus.circle.fill" )
                    Text("Create")
                }
            MessagesView()
                .tag(2)
                .tabItem(){
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
        }
        
    }
}
struct NavigationBarBottom_Preview: PreviewProvider{
    static var previews: some View{
        NavigationBarBottom()
    }
}
