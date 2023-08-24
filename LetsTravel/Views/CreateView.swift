//
//  CreateView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct CreateView: View {
    var body: some View{
        ZStack {
            Color.red
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color.white)
                .font(.system(size:100.0))
        }
    }
}

struct CreateView_Previews: PreviewProvider{
    static var previews: some View{
        CreateView()
    }
}
