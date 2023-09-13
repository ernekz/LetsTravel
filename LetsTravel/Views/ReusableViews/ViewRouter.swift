//
//  ViewRouter.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-13.
//

import Foundation

class ViewRouter: ObservableObject{
    @Published var currentView: ContentView = .home
    
    enum ContentView {
        case home
        case profile
        case editProfile
    }
    
    func navigate(to view: ContentView){
        currentView = view
    }
}
