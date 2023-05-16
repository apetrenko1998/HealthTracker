//
//  Ration+Extension.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//

import Foundation

extension Ration {
    var wrappedRationItems: [RationItem] {
        let set = rationItems as? Set<RationItem> ?? []
        
        return set.sorted {
            $0.wrappedAddedDate > $1.wrappedAddedDate
        }
    }
}
