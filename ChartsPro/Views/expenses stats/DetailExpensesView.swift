//
//  DetailExpensesView.swift
//  ChartsPro
//
//  Created by Olibo moni on 25/08/2024.
//

import SwiftUI
import Charts

struct DetailExpensesView: View {
    @StateObject var expensesViewModel: ExpensesViewModel
    
    var body: some View {
        List{
            Group {
                
                Section {
                    ExpensesLineChartView(expensesViewModel: expensesViewModel)
                }
                
                Section {
                    Text("Detailed Breakdown of Your Expenses Per Month")
                        .bold()
                        .padding(.top, 30)
                    ExpensesDetailGridView(expensesViewModel: expensesViewModel)
                }
            }
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
        }
        .listStyle(.plain)
    }
}

#Preview {
    DetailExpensesView(expensesViewModel: .preview)
}
