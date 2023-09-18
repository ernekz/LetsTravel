//
//  NavigationRouter.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-15.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var currentRoute: Route? = nil

    func navigate<Content: View>(_ route: Content) {
        
        currentRoute = Route(route)
        print("Navigation has been clicked: \(String(describing: currentRoute))")
    }

    func goBack() {
        currentRoute = nil
    }
}
