//
//  HeaderView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var body: some View {
            HStack{
                NavigationLink(destination: ProfileView()){
                    Image("avatars")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 10)
                }
                    
                
                Spacer()
                
                Image(systemName: "location.fill")
                    .foregroundColor(.blue)
                Text("Horsens, DK")
                    .font(.system(size:16))
                
                Spacer()
                NavigationLink(destination: NotificationView()){
                    Image(systemName: "bell.fill")
                        .padding(.trailing, 10)
                }.navigationBarBackButtonHidden(true)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 3)
    }
}

struct HeaderView_Preview: PreviewProvider{
    static var previews: some View{
        HeaderView()
    }
}
