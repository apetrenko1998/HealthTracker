//
//  FoodListView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 04/05/2023.
//

import SwiftUI

struct FoodListView: View {
    let dishes: [Dish] = []
    
    @State var searchableText: String = ""
    
    var body: some View {
        NavigationView {
            List(dishes) {
                FoodListRow(dish: $0)
                    .background {
                        AppColour.greenColor
                    }
                    .cornerRadius(40)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Food list")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchableText, prompt: "Search for a dish")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Add button was pressed")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(AppColour.orangeColor)
                            .fontWeight(.semibold)
                    }

                }
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
