//
//  ProfileView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-05.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @StateObject private var profileViewModel = ProfileViewModel()
    
    @State private var state: activeButton = .Posts
    
    @State private var isActionSheetVisible = false
    
    @State private var isClicked = false
    
    @State private var isMenuVisible = false
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Image("avatars")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    
                    Spacer()
                    Button(action: {
                        self.isActionSheetVisible.toggle()
                    }) {
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                    }
                    .actionSheet(isPresented: $isActionSheetVisible) {
                        ActionSheet(title: Text("Menu"), buttons: [
                            .default(Text("Edit Profile")) {
                                // Handle edit profile action
                            },
                            .default(Text("Logout")) {
                                // Handle logout action
                            },
                            .cancel()
                        ])
                    }
                    
                    
                }
            }
            
                HStack{
                    Text("Friends : 100")
                        .font(.footnote)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack{
                    Text("Ernestas Kazinevicius")
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Button{
                        state = .Posts
                    }label: {
                        Text("Posts")
                    }
                    Spacer()
                    
                    Button{
                        state = activeButton.Destinations
                    }label: {
                        Text("Destinations")
                    }
                    Spacer()
                    
                    Button {
                        state = activeButton.Likes
                    } label: {
                        Text("Liked")
                    }
                    Spacer()
                    
                    
                }
                .padding(.top)
                
                // Based on selection it will fetch either posts or destinations
                
                ScrollView{
                    VStack{
                        if state == .Posts{
                            
                            //Fetch post data and show it this one is gonna be default one
                            ForEach(0 ... 10, id: \.self) { post in
                                FeedCell()
                                    .frame(width: 400)
                            }
                        } else if state == .Destinations{
                            ForEach(profileViewModel.destinations, id: \.id) { destinations in
                                DestinationCell(item:destinations, isLiked: false)
                                    .padding(.bottom, 2)
                            }
                            
                        } else if state == .Likes{
                            ForEach(profileViewModel.destinations, id: \.id) { destinations in
                                DestinationCell(item: destinations, isLiked: true)
                            }
                            
                        }
                        
                    }
                    
                }
                
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
            
            
        }.onAppear{
            profileViewModel.fetchUserDestinations()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

enum activeButton {
    case Posts, Destinations, Likes
}
