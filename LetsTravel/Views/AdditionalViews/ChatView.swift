//
//  ChatView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-31.
//

import Foundation

import SwiftUI

struct ChatView: View{
    @State var chatText = ""
    
    
    var body: some View{
        VStack{
            chatMessagesView
            chatBottomBar
            
        }
    }
    
    private var chatMessagesView: some View{
        ScrollView{
            ForEach(0..<10) { num in
                HStack{
                    Spacer()
                    HStack{
                        Text("fake message ")
                            .foregroundColor(.white)
                    }.padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            
            HStack{
                Spacer()
            }
        }
        .background(Color(.init(white: 0.95, alpha: 1)))
    }
    
    private var chatBottomBar: some View {
        HStack(spacing: 16){
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 24))
                .foregroundColor(Color(.darkGray))
            TextField("Descripton", text: $chatText)
            Button{
                
            }label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(Color.blue)
            .cornerRadius(10)
            
        }
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View{
        ChatView()
    }
}
