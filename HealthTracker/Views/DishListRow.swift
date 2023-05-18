//
//  DishListRow.swift
//  HealthTracker
//
//  Created by Антон Петренко on 06/05/2023.
//

import SwiftUI

struct DishListRow: View {
    let dish: Dish
    
    var body: some View {
        HStack(spacing: 8) {
            if let photoData = dish.photo, let dishImage = UIImage(data: photoData) {
                Image(uiImage: dishImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(30)
                    .padding([.leading, .top, .bottom])
            }
            
            VStack(alignment: .leading) {
                Text(dish.name ?? "")
                    .font(.title)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundColor(AppColour.whiteColor)
                Text("\(dish.kcal) kcal")
                    .font(.subheadline)
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundColor(AppColour.whiteColor)
            }
            
            Spacer()
        }
    }
}

//struct FoodListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodListRow(dish: Dish.dishesMock[0])
//    }
//}
