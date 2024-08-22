//
//  SalesByWeekdayHeaderView.swift
//  ChartsPro
//
//  Created by Olibo moni on 21/08/2024.
//

import SwiftUI

struct SalesByWeekdayHeaderView: View {
    @ObservedObject var salesViewModel: SalesViewModel

    var body: some View {
        if let highestSellingWeekday = salesViewModel.highestSellingWeekday {
                     Text("Your highest selling day of the week is ") +
                     Text("\(longWeekday(for: highestSellingWeekday.number))").bold().foregroundColor(.blue) +
                     Text(" with an average of ") +
                     Text("\(Int(highestSellingWeekday.sales)) sales per day.").bold()
                 }
    }
    
    let formatter = DateFormatter()
    func longWeekday(for number: Int) -> String {
           formatter.weekdaySymbols[number - 1]
       }
}

#Preview {
    SalesByWeekdayHeaderView(salesViewModel: .preview)
}
