//
//  MessagesView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct MessagesView: View {
    var body: some View{
        ZStack {
            Color.red
            Image(systemName: "message.fill")
                .foregroundColor(Color.white)
                .font(.system(size:100.0))
        }
    }
}

struct MessagesView_Previews: PreviewProvider{
    static var previews: some View{
        MessagesView()
    }
}
