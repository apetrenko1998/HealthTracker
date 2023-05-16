//
//  RationView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 06/05/2023.
//

import SwiftUI

struct RationView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Ration.date, ascending: true)],
        animation: .default)
    private var dailyConsumption: FetchedResults<Ration>
    @State private var showingSheet = false
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns,
                          alignment: .center,
                          spacing: 20) {
                    if let rationItems = dailyConsumption.first?.wrappedRationItems {
                        ForEach(rationItems, id: \.id) { rationItem in
                            DishView(rationItem: rationItem)
                                .cornerRadius(40)
                        }
                    }
                }
                .id(UUID())
            }
            .padding()
            .navigationTitle("Ration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(AppColour.orangeColor)
                            .fontWeight(.semibold)
                    }

                }
            }
            .onAppear {
                if dailyConsumption.first == nil {
                    debugPrint("Daily consumption first: \(dailyConsumption.first)")
//                    let currentDayRation: Ration = .init(context: viewContext)
//                    currentDayRation.date = .today
//                    let rationItem: RationItem = .init(context: viewContext)
//                    rationItem.amount = 120
//                    rationItem.dateAdded = .now
//
//                    do {
//                        try viewContext.save()
//                        debugPrint("✅ Ration for today was created")
//                    } catch {
//                        debugPrint("Failed to save context")
//                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddDishModalView()
            }
        }
    }
}
