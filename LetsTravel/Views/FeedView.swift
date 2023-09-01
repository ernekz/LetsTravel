//
//  FeedView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-31.
//

import Foundation

import SwiftUI

struct FeedView: View {
    var body: some View{
        NavigationStack {
            HeaderView() 
            ScrollView{
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self) { post in
                        FeedCell()
                        
                    }
                }
            }
        }
    }
}

struct FeedView_Preview: PreviewProvider{
    static var previews: some View{
        FeedView()
    }
}
