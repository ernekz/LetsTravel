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
