//
//  Route.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-15.
//

import Foundation
import SwiftUI

struct Route{
    let id: UUID
    let view: AnyView

    init<Content: View>(_ view: Content) {
        self.id = UUID()
        self.view = AnyView(view)
    }
}

extension Route: Equatable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
    }
}

