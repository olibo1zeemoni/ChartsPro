//
//  DetailBookSalesView.swift
//  ChartsPro
//
//  Created by Olibo moni on 15/08/2024.
//

import SwiftUI

struct DetailBookSalesView: View {
    enum TimeInterval: String, CaseIterable, Identifiable {
        case day = "Day"
        case week = "Week"
        case month = "Month"
        var id: Self { self }
    }
    @ObservedObject var salesViewMode: SalesViewModel
    @State private var selectedTimeInterval = TimeInterval.day
    
    var body: some View {
        VStack {
            Picker(selection: $selectedTimeInterval.animation()) {
                ForEach(TimeInterval.allCases){ interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time Interval for chart")
            }
            .pickerStyle(.segmented)
            
            Group {
                Text("You sold ") +
                Text("\(salesViewMode.totalSales) books")
                    .bold().foregroundStyle(Color.accentColor) +
                Text(" in the last 90 days")
            }.padding(.vertical)
            
            Group{
                switch selectedTimeInterval {
                case .day:
                    DailySalesChartView(salesData: salesViewMode.salesData)
                case .week:
                    WeeklySalesChartView(salesDataVM: salesViewMode)
                case .month:
                    MonthlySalesChartView(salesData: salesViewMode.salesData)
                }
            }
            .aspectRatio(0.9, contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    DetailBookSalesView(salesViewMode: .preview)
}
