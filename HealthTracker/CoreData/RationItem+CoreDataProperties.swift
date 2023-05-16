//
//  RationItem+CoreDataProperties.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//
//

import Foundation
import CoreData


extension RationItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RationItem> {
        return NSFetchRequest<RationItem>(entityName: "RationItem")
    }

    @NSManaged public var amount: Double
    @NSManaged public var dateAdded: Date?
    @NSManaged public var dish: Dish?
    @NSManaged public var ration: Ration?

}

extension RationItem : Identifiable {

}
