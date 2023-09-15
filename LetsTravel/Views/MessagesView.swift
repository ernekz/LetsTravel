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
        NavigationView{
            VStack{
                HeaderView()
                messageView
            }
        }
    }
}

private var messageView: some View {
    ScrollView {
        ForEach(0..<10, id: \.self) { num in
            VStack{
                NavigationLink{
                    ChatView()
                } label: {
                    HStack(spacing: 16){
                        Image(systemName: "person.fill")
                            .font(.system(size:32))
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color(.label), lineWidth: 1)
                            )
                        VStack(alignment: .leading){
                            Text("User")
                                .font(.system(size: 16, weight: .bold
                                             ))
                            Text("Message sent to user")
                                .font(.system(size: 14))
                                .foregroundColor(Color(.lightGray))
                        }
                        Spacer()
                        Text("22d")
                            .font(.system(size:14, weight: .semibold))
                    }
                }.buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, 8)
            }.padding(.horizontal)
        }
    }.padding(.top)
}

struct MessagesView_Previews: PreviewProvider{
    static var previews: some View{
        MessagesView()

    }
}
