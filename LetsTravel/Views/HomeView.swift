//
//  HomeView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var search: String = ""
    let continentsData = [
            Continent(id: 1, name: "Africa"),
            Continent(id: 2, name: "Asia"),
            Continent(id: 3, name: "Europe"),
            Continent(id: 4, name: "Europe"),
            Continent(id: 5, name: "Europe"),
            Continent(id: 6, name: "Europe"),
        ]
    
    @State private var currentIndex: Int = 0
    @State private var dragOffSet: CGFloat = 0
    
    private let images: [String] = ["image1", "image2", "image3", "image4", "image5"]
    @State private var activeRegion: Int = 1
    @State private var selectedDestinationIndex: Int = 0
    
    let data: [DestinationData] = DestinationData.sampleData
    
    var body: some View{
        VStack(spacing: 0.0){
            ZStack(alignment: .trailing){
                TextField("Search", text:$search)
                    .frame(width: 300, height: 45)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                    .cornerRadius(26)
                    
                    
                    Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(.trailing, 15)
                            .background(
                                Ellipse()
                                    .fill(Color(red: 212/255, green: 165/255, blue: 116/255))
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 13)
                            )
                     
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(continentsData, id: \.id){ item in
                        let isActive = item.id == activeRegion
                        Button(action: {
                            activeRegion = item.id
                        }) {
                            Text(item.name)
                                .font(.system(size:14))
                                .padding(.horizontal, 28)
                                .padding(.vertical, 14)
                                .foregroundColor(.black)
                                .background(isActive ? Color(red: 212/255, green: 165/255, blue: 112/255) : Color(red: 191/255, green: 189/255, blue: 180/255))
                                .cornerRadius(25)
                        }
                        
                    }
                }
                .padding(.horizontal, 18)
                .padding(.top, 12)
            }
            Spacer()
            
            
            ZStack{
                ZStack{
                    ForEach(0..<data.count, id: \.self){ index in
                            DestinationCard(item: data[index])
                                .frame(width: 250, height: 400)
                                .cornerRadius(25)
                                .opacity(currentIndex == index ? 1.0 : 0.5)
                                .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                                .offset(x: CGFloat(index - currentIndex) * 265 + dragOffSet, y: 0)
                        
                        
                    }
                }
                .gesture(
                DragGesture()
                    .onEnded{value in
                        let threshold: CGFloat = 50
                        if value.translation.width > threshold {
                            withAnimation{
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation{
                                currentIndex = min(data.count - 1, currentIndex + 1)
                            }
                        }
                    }
               
                )
            }
            
            
            
            Spacer()
            
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}

struct Continent: Identifiable {
    let id: Int
    let name: String
}
