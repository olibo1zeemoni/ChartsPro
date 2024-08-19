//
//  MonthlySalesChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 15/08/2024.
//

import SwiftUI
import Charts

struct MonthlySalesChartView: View {
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesData) { sale in
            BarMark(x: .value("Month", sale.saleDate, unit: .month), y: .value("Sales", sale.quantity))
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
//        .chartYAxis {
//            AxisMarks(position: .trailing) { _ in
//                AxisGridLine(stroke: .init(dash: [10,20]))
//                AxisTick()
//                AxisValueLabel()
//            }
//        }
    }
}

#Preview {
    MonthlySalesChartView(salesData: Sale.threeMonthsExamples())
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
