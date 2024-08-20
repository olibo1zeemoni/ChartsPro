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
    @State private var rawSelectedDate: Date? = nil
    @Environment(\.calendar) var calendar
    
    var selectedDateValue: (day: Date, sales: Int)? {
        if let rawSelectedDate {
            
            return salesDataVM.salesByWeek.first(where: {
                //(startOfWeek, sales) in
                let startOfWeek = $0.day
                let endOfWeek = endOfWeek(for: startOfWeek) ?? Date()
                let toReturn = (startOfWeek ... endOfWeek).contains(rawSelectedDate)
                //print(toReturn)
                return toReturn
            })
        }
        
        return nil
    }
    
    var body: some View {
        
        Chart{
            ForEach(salesDataVM.salesByWeek, id: \.day) { sale in
                BarMark(x: .value("Week", sale.day, unit: .weekOfYear), y: .value("Sales", sale.sales))
            }
            .foregroundStyle(.blue.gradient)
            
            if let rawSelectedDate {
                RuleMark(x: .value("Selected Date", rawSelectedDate, unit: .day))
                    .foregroundStyle(.gray)
                    .opacity(0.3)
                    .zIndex(-1)
                    .annotation(position: .top, spacing: 0, overflowResolution: .init(x: .fit(to: .chart), y: .disabled)) {
                        selectionPopover
                    }
            }
        }
        .chartXSelection(value: $rawSelectedDate)
    }
    
    func endOfWeek(for startOfWeek: Date) -> Date? {
            calendar.date(byAdding: .day, value: 6, to: startOfWeek)
       }
       
   func beginningOfWeek(for date: Date) -> Date? {
       calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))
   }
    
    @ViewBuilder
    var selectionPopover: some View {
        if let selectedDateValue {
            VStack(alignment: .leading) {
                Text("\(selectedDateValue.day .formatted(.dateTime.day().month()))")
                Text("\(selectedDateValue.sales)")
            }
        }
    }
    
}

extension WeeklySalesChartView {
    var someText: some View {
        Text("show text")
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
