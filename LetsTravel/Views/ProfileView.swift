//
//  ProfileView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-05.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    
    var body: some View {
        VStack{
            HStack{
                Image("avatars")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                
                Spacer()
                Image(systemName: "gear")
                
                
            }
            HStack{
                Text("Friends : 100")
                Spacer()
            }
            
            HStack{
                Text("Ernestas Kazinevicius")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
        
            HStack{
                Text("Posts")
                    
                Text("Destinations")
                
                Text("Liked")
                    
            }
            .padding(.top)
            
            // Based on selection it will fetch either posts or destinations
            
            
            Spacer()
            Button{
                viewModel.logout{ success in
                    if success {
                        print("Loggout success")
                    } else {
                        print("Logout failed")
                    }
                }
            } label: {
                Text("Logout")
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
