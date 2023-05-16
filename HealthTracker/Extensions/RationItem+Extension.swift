//
//  RationItem+Extension.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//

import Foundation

extension RationItem {
    var wrappedAddedDate: Date {
        dateAdded ?? .now
    }
}
