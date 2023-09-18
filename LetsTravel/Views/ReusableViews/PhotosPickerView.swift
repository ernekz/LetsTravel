//
//  PhotosPickerView.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-09-18.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    @Binding var imageSelection: PhotosPickerItem?

    var body: some View {
        PhotosPicker(selection: $imageSelection) {
            Text("Edit profile picture")
                .font(.footnote)
                .fontWeight(.semibold)
        }
    }
}

struct PhotosPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPickerView(imageSelection: .constant(nil))
    }
}
