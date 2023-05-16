//
//  Dish+CoreDataProperties.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var name: String?
    @NSManaged public var kcal: Int16
    @NSManaged public var photo: Data?

}

extension Dish : Identifiable {

}
