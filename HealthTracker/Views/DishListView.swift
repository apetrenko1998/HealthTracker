//
//  FoodListView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 04/05/2023.
//

import SwiftUI

struct DishListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.name, ascending: true)],
        animation: .default)
    private var dishes: FetchedResults<Dish>
        
    @State var isModalPresented: Bool = false
    @State var searchableText: String = ""
    
    var body: some View {
        NavigationView {
            List(dishes) { dish in
                DishListRow(dish: dish)
                    .background {
                        AppColour.greenColor
                    }
                    .cornerRadius(40)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing,
                                  allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            deleteDish(dish)
                        } label: {
                            Text("Delete")
                        }

                    }
            }
            .listStyle(.plain)
            .navigationTitle("Food list")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchableText, prompt: "Search for a dish")
            .onChange(of: searchableText, perform: { newValue in
                dishes.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name CONTAINS %@", newValue)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(AppColour.orangeColor)
                            .fontWeight(.semibold)
                    }

                }
            }
            .sheet(isPresented: $isModalPresented) {
                AddDishModalView(viewModel: .init(), isPresented: $isModalPresented)
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    private func deleteDish(_ dish: Dish) {
        viewContext.delete(dish)
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        DishListView()
    }
}
