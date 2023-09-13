//
//  EditProfileRowView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-13.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let error: String
    var isSecureField = false
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
            
            Text(error)
                .foregroundColor(.red)
                .font(.system(size: 12))
            
            
            if isSecureField{
                SecureField(placeholder, text: $text)
                    .font(.subheadline)
            } else {
                TextField(placeholder, text: $text)
                    .font(.subheadline)
                }
            }
        Divider()
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileRowView(title: "Name", placeholder: "Enter your name", text: .constant(""), error: "not available")
    }
}
