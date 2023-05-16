//
//  DishView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 04/05/2023.
//

import SwiftUI

struct DishView: View {
    let rationItem: RationItem
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let photoData = rationItem.dish?.photo, let photoImage = UIImage(data: photoData) {
                Image(uiImage: photoImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            ZStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(AppColour.greenColor)
                    .frame(maxWidth: 150,
                           maxHeight: 70,
                           alignment: .center)
                    .cornerRadius(40, corners: .topRight)
                
                VStack {
                    Text(rationItem.dish?.name ?? "")
                        .font(.system(size: 18,
                                      weight: .heavy,
                                      design: .rounded))
                        .foregroundColor(AppColour.whiteColor)
                    Text("\(rationItem.dish?.kcal ?? 0) kcal")
                        .font(.system(size: 22,
                                      weight: .heavy,
                                      design: .rounded))
                        .foregroundColor(AppColour.whiteColor)
                }
            }
        }
    }
}

//struct DishView_Previews: PreviewProvider {
//    static var previews: some View {
//        DishView(rationItem: .init)
//    }
//}
