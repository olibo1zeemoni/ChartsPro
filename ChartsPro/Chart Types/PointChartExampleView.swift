//
//  PointChartExampleView.swift
//  ChartsPro
//
//  Created by Olibo moni on 10/08/2024.
//

import SwiftUI
import Charts

struct PointChartExampleView: View {
    struct DataSeries: Identifiable {
        var type: String
        var petData: [PetData]
        var id: String {
            return type
        }
    }
    
    let cats = PetData.catExample
    let dogs = PetData.dogExample
    
    var data: [DataSeries] {
        [ DataSeries(type: "cat", petData: cats),
          DataSeries(type: "dog", petData: dogs)
        ]
    }
    
    var body: some View {
        Chart(data) { dataSeries in
            ForEach(dataSeries.petData){ data in
                PointMark(x: .value("Year", data.year), y: .value("Population", data.population))
            }
            .foregroundStyle(by: .value("Pet Type", dataSeries.type))
            .symbol(by: .value("Pet Type", dataSeries.type))
        }
    .chartXScale(domain: 1998 ... 2024)
    .aspectRatio(1, contentMode: .fit)
    .padding()
    }
}

#Preview {
    PointChartExampleView()
}
