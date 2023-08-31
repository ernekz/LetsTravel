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
            HStack{
                Image(systemName: "gear")
                TextField("Descripton", text: $chatText)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View{
        ChatView()
    }
}
