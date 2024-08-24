//
//  SalesPerBookCategoryView.swift
//  ChartsPro
//
//  Created by Olibo moni on 22/08/2024.
//

import SwiftUI
import Charts

struct SalesPerBookCategoryView: View {
    enum ChartStyle: String, CaseIterable, Identifiable {
           case pie = "Pie Chart"
           case bar = "Bar Chart"
           case singleBar = "Single Bar"
         
           var id: Self { self }
       }
       
       @ObservedObject var salesViewModel: SalesViewModel
       @State private var selectedChartStyle: ChartStyle = .pie
    
    var body: some View {
        VStack {
            Picker("Chart Type", selection: $selectedChartStyle) {
                ForEach(ChartStyle.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            SalesByWeekdayHeaderView(salesViewModel: salesViewModel)
                .font(.title3).padding(.vertical)
            
            switch selectedChartStyle {
            case .pie:
                SalesPerBookCategoryPieChartView(salesViewModel: salesViewModel)
            case .bar:
                SalesPerBookCategoryBarChartView(salesViewModel: salesViewModel)
            case .singleBar:
                Text("1")
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    SalesPerBookCategoryView(salesViewModel: .preview)
}
