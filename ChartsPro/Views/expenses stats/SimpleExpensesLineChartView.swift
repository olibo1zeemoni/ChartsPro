//
//  SimpleExpensesLineChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 25/08/2024.
//

import SwiftUI
import Charts


struct SimpleExpensesLineChartView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    let linearGradient = LinearGradient(colors: [.pink.opacity(0.7), .pink.opacity(0.3)], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your total expenses for the last year is ") +
            Text("$\(String(format: "%0.2f", expensesViewModel.totalExpenses))")
                .bold()
                .foregroundStyle(.pink)
            
            Chart(expensesViewModel.monthlyExpenseData) { data in
                AreaMark(x: .value("month", data.month), y: .value("expenses", data.totalExpenses))
                    .foregroundStyle(linearGradient)
            }
            .frame(height: 70)
            .chartXScale(domain: 1...12)
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
        }
    }
}

#Preview {
    SimpleExpensesLineChartView(expensesViewModel: .preview)
        .padding()
}
