//
//  Route.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-15.
//

import Foundation
import SwiftUI

enum Route{
    case profile
    case editprofile
    case imagepicker
}

extension Route: Equatable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
    }
}


extension Route:View {
    var body: some View{
        switch self {
        case .profile:
            ProfileView()
        case .editprofile:
            EditProfileView()
        case .imagepicker:
            PhotosPickerView(imageSelection: .constant(nil))
        }
    }
}



