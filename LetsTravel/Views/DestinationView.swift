//
//  DestinationView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-25.
//

import Foundation

import SwiftUI

struct DestinationView: View{
    let item: DestinationData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            ZStack{
                Color.white
                
                VStack(alignment: .leading){
                    ZStack(alignment: .topLeading){
                        Image("Eiffel-tower")
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height:450)
                            .cornerRadius(45)
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                        }
                        .padding(.top, 50)
                        .padding(.leading, 10)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("", displayMode: .inline)
                    
                        
                        VStack{
                            Spacer()
                            HStack{
                                Image("avatars")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                
                                VStack(alignment: .leading){
                                    Text("John Doe")
                                        .font(.system(size: 13))
                                    Text("Lithuania")
                                        .font(.system(size: 10))
                                        .foregroundColor(.gray)
                                }
                                
                            }
                            .frame(width: 120, height: 40)
                            .background(.white.opacity(0.8))
                            .cornerRadius(25)
                            .padding(.bottom, 30)
                            .padding(.leading, 15)
                   
                        }
                        ZStack{
                            Color.white.opacity(0.8)
                                .frame(width: 35, height: 35)
                                .cornerRadius(30)
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .frame(width: 35, height: 35)
                                
                        }
                        .padding(.top, 432)
                        .padding(.leading, 330)
                    }
                    VStack(alignment: .leading){
                        HStack{
                            Text(item.city)
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                            Text(item.country)
                                .font(.system(size: 32))
                                .fontWeight(.semibold)
                        }
                        .padding(.leading,20)
                        .padding(.bottom, 1)
                        
                        HStack{
                            Text(item.description)
                                .font(.system(size: 14))
                        }
                        .padding(.leading,20)
                        .padding(.trailing, 10)
                        .padding(.top, 0)
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            VStack{
                                Image(systemName: "calendar")
                                    .font(.system(size: 30))
                                    .padding(.bottom,1)
                                Text("2023-09-10")
                                    .font(.system(size: 12))
                                    .padding(.top, 1)
                                    
                            }.frame(width: 75, height: 90)
                                .background(.gray.opacity(0.4))
                                .cornerRadius(15)
                                .padding(.trailing, 10)
                            
                            VStack{
                                Image(systemName: "clock")
                                    .font(.system(size: 30))
                                    .padding(.bottom,1)
                                Text("10 days")
                                    .font(.system(size: 12))

                                    
                            }.frame(width: 75, height: 90)
                                .background(.gray.opacity(0.4))
                                .cornerRadius(15)
                                .padding(.trailing, 10)
                            VStack{
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 30))
                                    .padding(.bottom,1)
                                Text("1/5")
                                    .font(.system(size: 12))
                                    .padding(.top, 1)
                                    
                            }.frame(width: 75, height: 90)
                                .background(.gray.opacity(0.4))
                                .cornerRadius(15)
                                .padding(.trailing, 10)
                            VStack{
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.system(size: 30))
                                Text("from: 800$")
                                    .font(.system(size: 12))
                                    .padding(.top, 1)
                                    
                            }.frame(width: 75, height: 90)
                                .background(.gray.opacity(0.4))
                                .cornerRadius(15)
                                .padding(.trailing, 10)
                        }
                        
                    } .padding(.leading, 20)
                        .padding(.top, 10)
                    
                    Button(action: {
                        
                    }){
                        Text("Join now")
                            .font(.system(size: 24) .weight(.semibold))
                    }
                    .frame(width: 200, height: 50)
                    .background(.cyan.opacity(0.9))
                    .cornerRadius(25)
                    .padding(.top, 15)
                    .padding(.leading,95)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}



struct DestinationView_Preview: PreviewProvider{
    static var previews: some View{
        let sampleData = DestinationData(id: 1, city: "Paris", country: "France", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUlr: "imgurl", description: "easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation easy trip for a good vacation")
        return DestinationView(item: sampleData)
            .previewLayout(.sizeThatFits)
    }
    
}
