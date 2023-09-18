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
    @State private var isLinkActive: Bool = false
    @EnvironmentObject private var tabSelection: TabSelection
    @EnvironmentObject private var router: NavigationRouter
    var body: some View{
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tag(0)
                .tabItem(){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .environmentObject(router)
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
            FeedView()
                .tag(3)
                .tabItem(){
                    Image(systemName: "newspaper.fill")
                    Text("Feed")
                }
        }
        
    }
}
struct NavigationBarBottom_Preview: PreviewProvider{
    static var previews: some View{
        NavigationBarBottom()
            .environmentObject(NavigationRouter())
    }
}
