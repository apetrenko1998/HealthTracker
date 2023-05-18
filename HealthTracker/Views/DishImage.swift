//
//  ProfileImage.swift
//  HealthTracker
//
//  Created by Антон Петренко on 18/05/2023.
//

import SwiftUI

struct DishImage: View {
    let imageState: ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "photo.fill")
                .font(.system(size: 40))
                .foregroundColor(AppColour.greenColor)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
        }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        DishImage(imageState: .empty)
    }
}
