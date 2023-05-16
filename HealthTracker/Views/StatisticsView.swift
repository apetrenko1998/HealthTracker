//
//  StatisticsView.swift
//  HealthTracker
//
//  Created by Антон Петренко on 04/05/2023.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        Color.orange
            .overlay {
                Text("Statistics")
                    .foregroundColor(.white)
            }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
