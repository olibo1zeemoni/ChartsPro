//
//  SalesPerBookCategoryBarChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 22/08/2024.
//

import SwiftUI
import Charts

struct SalesPerBookCategoryBarChartView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    
    var body: some View {
        Chart(salesViewModel.totalSalesPerCategory, id: \.category) { data in
            BarMark(x: .value("Sales", data.sales), y: .value("Category", data.category.displayName))
                .annotation(position: .trailing, alignment: .leading, spacing: 20, content: {
                    Text("\(data.sales)")
                        .opacity(salesViewModel.bestSellingCategory?.category == data.category ? 1 : 0.4)
                })
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", data.category.displayName))
                .opacity(salesViewModel.bestSellingCategory?.category == data.category ? 1 : 0.4)
            
        }
        .chartLegend(.hidden)
        .aspectRatio(1, contentMode: .fit)
        .chartForegroundStyleScale([BookCategory.fiction.displayName: .blue, BookCategory.business.displayName: .yellow, BookCategory.children.displayName: .green, BookCategory.computerScience.displayName: .indigo])
    }
}

#Preview {
    SalesPerBookCategoryBarChartView(salesViewModel: .preview)
        .padding()
}
