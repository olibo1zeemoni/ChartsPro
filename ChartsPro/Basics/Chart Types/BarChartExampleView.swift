//
//  BarChartExampleView.swift
//  ChartsPro
//
//  Created by Olibo moni on 10/08/2024.
//

import SwiftUI
import Charts

struct BarChartExampleView: View {
    let data = [
        ChartData(type: "bird", count: 10),
        ChartData(type: "dog", count: 21),
        ChartData(type: "cat", count: 18),
        ChartData(type: "cow", count: 40),
        ChartData(type: "rabbit", count: 60)
    ]
    
    var body: some View {
        Chart(data) { dataPoint in
            
            BarMark(x: .value("Population", dataPoint.count), y: .value("Type", dataPoint.type))
                .foregroundStyle(by: .value("Type", dataPoint.type))
                .annotation(position: .trailing) {
                    Text("\(dataPoint.count)")
                        .foregroundStyle(.gray)
                }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                AxisValueLabel()
                //AxisGridLine(centered: false, stroke: StrokeStyle(lineWidth: 10))
                
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    BarChartExampleView()
}
