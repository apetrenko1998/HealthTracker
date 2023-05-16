//
//  Ration+CoreDataProperties.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//
//

import Foundation
import CoreData


extension Ration {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ration> {
        return NSFetchRequest<Ration>(entityName: "Ration")
    }

    @NSManaged public var date: Date?
    @NSManaged public var rationItems: NSSet?

}

// MARK: Generated accessors for rationItems
extension Ration {

    @objc(addRationItemsObject:)
    @NSManaged public func addToRationItems(_ value: RationItem)

    @objc(removeRationItemsObject:)
    @NSManaged public func removeFromRationItems(_ value: RationItem)

    @objc(addRationItems:)
    @NSManaged public func addToRationItems(_ values: NSSet)

    @objc(removeRationItems:)
    @NSManaged public func removeFromRationItems(_ values: NSSet)

}

extension Ration : Identifiable {

}
