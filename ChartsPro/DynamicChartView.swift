//
//  DynamicChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 09/08/2024.
//

import SwiftUI
import Charts

struct ChartData: Identifiable, Equatable {
    var type: String
    var count: Int
    
    var id: String {
        return type
    }
}

struct DynamicChartView: View {
    
    let data = [
        ChartData(type: "bird", count: 1),
        ChartData(type: "dog", count: 2),
        ChartData(type: "cat", count: 3),
        ChartData(type: "cow", count: 4),
    ]
    
    var maxChartData: ChartData? {
        data.max{ $0.count < $1.count }
    }
    
    var body: some View {
        Chart {
            ForEach(data) { input in
                
                BarMark(x: .value("Type", input.type), y: .value("Population", input.count))
                    .opacity(maxChartData == input ? 1 : 0.5)
                    .foregroundStyle(maxChartData == input ? Color.accentColor: .gray)
            }
            
            RuleMark(y: .value("average", 1.5))
                .foregroundStyle(.gray)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    DynamicChartView()
}



