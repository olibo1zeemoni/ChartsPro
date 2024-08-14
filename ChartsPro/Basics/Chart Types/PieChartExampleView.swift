//
//  PieChartExampleView.swift
//  ChartsPro
//
//  Created by Olibo moni on 10/08/2024.
//

import SwiftUI
import Charts

struct PieChartExampleView: View {
    
    var catTotal: Double {
        PetData.catExample.reduce(0){ $0 + $1.population}
    }
    
    var dogTotal: Double {
        PetData.dogExample.reduce(0) { $0 + $1.population}
    }
    
    var data: [(type: String, amount: Double)] {
        [(type: "cat",amount: catTotal), (type: "dog",amount: dogTotal)]
    }
    
    var maxPet: String? {
        data.max{ $0.amount < $1.amount}?.type
    }
    
    
    var body: some View {
        Chart(data, id: \.type) { dataPoint in
            SectorMark(angle: .value("Type", dataPoint.amount), innerRadius: .ratio(0.5), angularInset: 1)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Type", dataPoint.type))
                .opacity(dataPoint.type == maxPet ? 1: 0.5)
        }
        .frame(width: 300)
    }
}

#Preview {
    PieChartExampleView()
}
