//
//  NavigationRouter.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-15.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()
       
       func push(to screen: Route) {
           routes.append(screen)
       }
       
       func goBack() {
           _ = routes.popLast()
       }
       
       func reset() {
           routes = []
       }
}
