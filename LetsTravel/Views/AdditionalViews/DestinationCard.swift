//
//  DestinationCard.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct DestinationCard: View{
    let item: DestinationData
    
    var body: some View{
            VStack{
                Image("paris")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 200)
                    .clipped()
                    .offset(y: -24)
                
                HStack {
                    Text("\(item.city)")
                        .font(.system(size:24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 2)
                    Text(item.country)
                        .font(.system(size:24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 2)
                }
                
                HStack{
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .padding(4)
                    Text("\(item.people)")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(5)
                }
                .padding(.top, 2)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.gray)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 5)
                
                HStack{
                    Text("Leaving date:")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.white.opacity(0.6))
                    Text(item.leavingDate)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }.padding(.top,1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 5)
                
                HStack{
                    Text("Duration:")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.white.opacity(0.6))
                    Text("10" + " days")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }.padding(.top, 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 5)
                
                
                

               NavigationLink(
                destination: {
                    DestinationView(item: item)
                },
                label: {
                    HStack{
                        Text("Let's travel")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 8)
                })
               .navigationBarBackButtonHidden(true)
                
                
                
            }
            .frame(width: 250, height: 400)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color(#colorLiteral(red: 0.5490196078, green: 0.3254901961, blue: 0.09803921569, alpha: 1)))
            )
        }
}


struct DestinationCardView_Preview: PreviewProvider{
    static var previews: some View{
        let sampleData = DestinationData(id: 1, city: "Paris", country: "France", people: 5, leavingDate: "2023-09-01", returningDate: "2023-09-10", imageUlr: "imgurl", description: "easy trip for a good vacation")
        return DestinationCard(item: sampleData)
            .previewLayout(.sizeThatFits)
    }
}
