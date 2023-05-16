//
//  HealthTrackerApp.swift
//  HealthTracker
//
//  Created by Антон Петренко on 03/05/2023.
//

import SwiftUI

@main
struct HealthTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabView {
                RationView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Ration", systemImage: "list.bullet.clipboard.fill")
                    }
                
                StatisticsView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Statistics", systemImage: "eye")
                    }
                
                FoodListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Food", systemImage: "carrot.fill")
                    }
            }
        }
        
    }
}
