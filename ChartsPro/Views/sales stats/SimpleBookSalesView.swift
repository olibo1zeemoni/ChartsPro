//
//  SimpleBookSalesView.swift
//  ChartsPro
//
//  Created by Olibo moni on 15/08/2024.
//

import SwiftUI

struct SimpleBookSalesView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    
    var body: some View {
        VStack(alignment: .leading)
        {
            if let changedBookSales = changedBookSales() {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: isPositiveChange ? "arrow.up.right" : "arrow.down.right").bold()
                        .foregroundColor( isPositiveChange ? .green : .red)
                    
                    Text("You book sales ") +
                    Text(changedBookSales)
                        .bold() +
                    Text(" in the last 90 days.")
                }
            }
            WeeklySalesChartView(salesDataVM: salesViewModel)
                .frame(height: 100)
        }
    }
    
    var percentage: Double {
        Double(salesViewModel.totalSales) / Double(salesViewModel.lastTotalSales) - 1
    }
    
    var isPositiveChange: Bool {
        percentage > 0
    }
    
    func changedBookSales() -> String? {
        let percentage = percentage
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else { return nil }
        
        let changedDescription = percentage < 0 ? "decreased by " : "increased by "
        
        return changedDescription + formattedPercentage
    }
}

#Preview("decreased") {
    SimpleBookSalesView(salesViewModel: SalesViewModel.preview)
        .padding()
}

#Preview("increased"){
    let vm = SalesViewModel.preview
    vm.lastTotalSales = 860
    return SimpleBookSalesView(salesViewModel: vm).padding()
}
