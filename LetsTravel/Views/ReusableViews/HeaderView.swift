//
//  HeaderView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-24.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @EnvironmentObject private var router: NavigationRouter
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
            HStack{
                Button{
                    router.push(to: .profile)
                    print("Navigating to ProfileView")
                }label: {
                    if let uiImage = UIImage(data: viewModel.user.avatar!){
                        Image(uiImage: uiImage)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                            
                    }else {
                        Image("avatars")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                    }
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
            }.onAppear{
                viewModel.fetchUser()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 3)
    }
}

struct HeaderView_Preview: PreviewProvider{
    static var previews: some View{
        HeaderView()
            .environmentObject(NavigationRouter())
    }
}
