//
//  RectangularChartExample.swift
//  ChartsPro
//
//  Created by Olibo moni on 10/08/2024.
//

import SwiftUI
import Charts

struct RectangularChartExample: View {
    let data = PetData.catExample
    
    var body: some View {
        Chart(data) { dataPoint in
            RectangleMark(x: .value("Year", dataPoint.year), y: .value("Population", dataPoint.population), width: .fixed(15), height: .fixed(10))
                .opacity(0.2)
            PointMark(
                x: .value("X", dataPoint.year),
                y: .value("Y", dataPoint.population)
            )
            
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    RectangularChartExample()
}


