//
//  NavigationBarBottom.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct NavigationBarBottom: View {
    var body: some View{
        TabView {
            
            HomeView()
                .tabItem(){
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            CreateView()
                .tabItem(){
                    Image(systemName: "plus.circle.fill" )
                    Text("Create")
                }
            MessagesView()
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
