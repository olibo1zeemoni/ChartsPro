//
//  WeeklySalesChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 15/08/2024.
//

import SwiftUI
import Charts

struct WeeklySalesChartView: View {
   @ObservedObject var salesDataVM: SalesViewModel
    
    var body: some View {
        Chart(salesDataVM.salesByWeek, id: \.day) { sale in
            BarMark(x: .value("Week", sale.day, unit: .weekOfYear), y: .value("Sales", sale.sales))
        }
        .foregroundStyle(.blue.gradient)
    }
}

struct PlainDataWeeklySalesChartView: View {
    let salesData: [Sale]
    
    var body: some View {
        Chart(salesData) { sale in
            BarMark(x: .value("Week", sale.saleDate, unit: .weekOfYear), y: .value("Sales", sale.quantity))
        }
        .foregroundStyle(.blue.gradient)
    }
}

#Preview("preview") {
    WeeklySalesChartView(salesDataVM: SalesViewModel.preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}

#Preview("plain") {
    PlainDataWeeklySalesChartView(salesData: Sale.threeMonthsExamples())
        .aspectRatio(1, contentMode: .fit)
        .padding()

}
