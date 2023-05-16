//
//  Date+Extension.swift
//  HealthTracker
//
//  Created by Антон Петренко on 08/05/2023.
//

import Foundation

extension Date {
    static var today: Date {
        let calendar = Calendar.current
        
        return calendar.dateComponents([.day, .month, .year], from: .now).date ?? .now
    }
}
