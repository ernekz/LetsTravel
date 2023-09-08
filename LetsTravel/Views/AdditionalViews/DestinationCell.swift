//
//  DestinationCell.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-08.
//

import SwiftUI

struct DestinationCell: View {
    var isLiked = false
    var body: some View {
        VStack{
            HStack{
                Image("Eiffel-tower")
                    .resizable()
                    .frame(width: 175, height: 235)
                    .cornerRadius(25)
                
                Spacer()
                
                VStack{
                    HStack(alignment: .top){
                        Text("Paris,")
                            .font(.system(size: 20))
                            .bold()
                        Text("France")
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                        
                        if isLiked{
                            Button{
                                
                            }label: {
                                Text("Edit")
                            }.padding(.top, 2)
                                .padding(.trailing, 2)
                            
                        }
                        else {
                            Button{
                                
                            } label: {
                                Image(systemName: "heart.fill")
                                    .background(.white.opacity(0.5))
                                    .cornerRadius(25)
                            }
                        }
                    }.padding(.bottom, 2)
                    
                    HStack{
                        Text("Leaving date:")
                            .font(.system(size: 14))
                        
                        Spacer()
                        Text("2020-09-30")
                            .font(.system(size: 14))
                        
                    }
                    HStack{
                        Text("Returning date:")
                            .font(.system(size: 14))
                        
                        Spacer()
                        Text("2020-09-30")
                            .font(.system(size: 14))
                    }
                    
                    HStack{
                        Text("People:")
                            .font(.system(size: 14))
                        Spacer()
                        
                        Text("1/5")
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                    }.padding(.top, 1)
                    
                    VStack{
                        HStack{
                            Text("Short description:")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        Text("Traveling to Paris for 10 days to see eiffel tower and its surroundings")
                            .font(.system(size: 14))
                    }
                    .padding(.top, 1)
                }
                Spacer()
                
                
        
            }
            .background(.gray.opacity(0.9))
            .cornerRadius(25)
            
        }
    }
}

struct DestinationCell_Previews: PreviewProvider {
    static var previews: some View {
        DestinationCell()
    }
}
