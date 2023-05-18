//
//  Persistence.swift
//  HealthTracker
//
//  Created by Антон Петренко on 03/05/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let initialInfoDatabaseName: String = "CoreDataPrefillApp"
    let databaseName: String = "HealthTracker.sqlite"
    
    var sharedStoreURL: URL {
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.APetrenko.HealthTracker")!
        debugPrint("Shared store path: \(container.absoluteString)")
        return container.appending(path: databaseName)
    }
    
    var initialInfoDatabaseURL: URL {
        guard let initialInfoDBUrl = Bundle.main.url(forResource: initialInfoDatabaseName, withExtension: "sqlite") else {
            let emptyURL = URL.desktopDirectory
            return emptyURL
        }
        
        return initialInfoDBUrl
    }
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "HealthTracker")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        mergeInitialInfoStore(for: container)
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    private func mergeInitialInfoStore(for container: NSPersistentContainer) {
        print("➡️ went into migrate store")
        let coordinator: NSPersistentStoreCoordinator = container.persistentStoreCoordinator
        
        let storeDescription = NSPersistentStoreDescription(url: initialInfoDatabaseURL)
        container.persistentStoreDescriptions.append(storeDescription)
        
        do {
            _ = try coordinator.addPersistentStore(type: .sqlite, at: initialInfoDatabaseURL)
        } catch {
            print("🤬 filed to add Persistent Store")
        }
        
        
        guard let oldStore = coordinator.persistentStore(for: initialInfoDatabaseURL) else { return
        }
        print("👨‍🦽 old store located")
        
        do {
            _ = try coordinator.migratePersistentStore(oldStore, to: sharedStoreURL, type: .sqlite)
            print("🏁 migration success")
        } catch {
            fatalError("Unable to migrate to shared store")
        }
    }
}
