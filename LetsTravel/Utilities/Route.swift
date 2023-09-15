//
//  Route.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-15.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case profile
    //case editProfileView
   // case imagePickerView
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

extension Route {
    var destinationView: some View {
            switch self {
            case .profile:
                return AnyView(ProfileView())
            }
        }
}
