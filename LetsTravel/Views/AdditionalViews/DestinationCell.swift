//
//  DestinationCell.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-08.
//

import SwiftUI

struct DestinationCell: View {
    let item: Destination
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
                        Text("\(item.city)")
                            .font(.system(size: 20))
                            .bold()
                        Text("\(item.country)")
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
                        Text(item.leavingDate!)
                            .font(.system(size: 14))
                        
                    }
                    HStack{
                        Text("Returning date:")
                            .font(.system(size: 14))
                        
                        Spacer()
                        Text(item.returningDate!)
                            .font(.system(size: 14))
                    }
                    
                    HStack{
                        Text("People:")
                            .font(.system(size: 14))
                        Spacer()
                        
                        Text("\(item.people)")
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                    }.padding(.top, 1)
                    
                    VStack{
                        HStack{
                            Text("Short description:")
                                .font(.system(size: 14))
                            Spacer()
                        }
                        Text("\(item.description)")
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
        let sampleData = Destination(id: 1, continentId: 2, city: "Paris", country: "France", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUrl: "imgurl", description: "easy trip for a good vacation")

        return DestinationCell(item: sampleData)
    }
}
