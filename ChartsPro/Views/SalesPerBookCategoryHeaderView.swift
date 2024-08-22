//
//  SalesPerBookCategoryHeaderView.swift
//  ChartsPro
//
//  Created by Olibo moni on 22/08/2024.
//

import SwiftUI

struct SalesPerBookCategoryHeaderView: View {
    @ObservedObject var salesViewModel: SalesViewModel
    var body: some View {
        if let bestSellingCategory = salesViewModel.bestSellingCategory, let bestsellingCategoryPercentage
                            {
                           Text("Your best selling category is ") + Text("\(bestSellingCategory.category.displayName)").bold().foregroundColor(.blue) +
                           Text(" with ") +
                           Text("\(bestsellingCategoryPercentage)").bold() +
                           Text(" of all sales.")
                           
                       }
    }
    
    var bestsellingCategoryPercentage: String? {
          guard let bestSellingCategory = salesViewModel.bestSellingCategory else { return nil }
          
           let percentage = Double(bestSellingCategory.sales) / Double(salesViewModel.totalSales)
           let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
           
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else {
            return nil
        }
           
           return formattedPercentage
       }
}

#Preview {
    SalesPerBookCategoryHeaderView(salesViewModel: .preview)
}
