//
//  PetStatisticsView.swift
//  ChartsPro
//
//  Created by Olibo moni on 09/08/2024.
//

import SwiftUI
import Charts

struct PetStatisticsView: View {
    var cats = PetData.catExample
    var dogs = PetData.dogExample
    
    
    var body: some View {
        Chart {
            ForEach(cats) { cat in
                BarMark(x: .value("Year", cat.year), y: .value("Population", cat.population))
            }
            
            ForEach(dogs) { dog in
                BarMark(x: .value("Year", dog.year), y: .value("Population", dog.population))
            }
            .foregroundStyle(.orange)
            
        }
        .chartXScale(domain: 1998 ... 2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct SecondStaticsView: View {
    var data: [(type: String, petData: [PetData])] {
        [(type: "cat", petData: PetData.catExample),
         (type: "dog", petData: PetData.dogExample)
        ]
    }
    
    var body: some View {
        Chart (data, id: \.type) { dataSeries in
                ForEach(dataSeries.petData){data in
                    LineMark(x: .value("Year", data.year), y: .value("Population", data.population))
                }
                .foregroundStyle(by: .value("Pet Type", dataSeries.type))
                .symbol(by: .value("Pet Type", dataSeries.type))
            }
        .chartXScale(domain: 1998 ... 2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct ThirdStatisticsView: View {
    
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
                LineMark(x: .value("Year", data.year), y: .value("Population", data.population))
            }
            .foregroundStyle(by: .value("Pet Type", dataSeries.type))
            .symbol(by: .value("Pet Type", dataSeries.type))
        }
    .chartXScale(domain: 1998 ... 2024)
    .aspectRatio(1, contentMode: .fit)
    .padding()
    }
}

#Preview("first") {
    PetStatisticsView()
}

#Preview("second"){
    SecondStaticsView()
}

#Preview("third") {
    ThirdStatisticsView()
}
