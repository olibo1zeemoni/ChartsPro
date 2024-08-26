//
//  ExpensesDetailGridView.swift
//  ChartsPro
//
//  Created by Olibo moni on 25/08/2024.
//

import SwiftUI

struct ExpensesDetailGridView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel

    
    var body: some View {
        Grid(alignment: .trailing, horizontalSpacing: 15, verticalSpacing: 10) {
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                Group {
                    Text("Fixed")
                    Text("Variable")
                    Text("All")
                }
                .gridCellAnchor(.center)
                
            }
            Divider()
            
            ForEach(expensesViewModel.monthlyExpenseData){ data in
                GridRow{
                    Text(month(for: data.month))
                    Text(String(format: "%.2f", data.fixedExpenses))
                    Text(String(format: "%.2f", data.variableExpenses))
                    Text(String(format: "%.2f", data.totalExpenses))
                }
            }
            
            Divider()
            GridRow {
                Text("Total")
                    .bold()
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                    .gridCellColumns(2)
                
                Text("$\(String(format: "%.2f", expensesViewModel.totalExpenses ))")
                    .foregroundStyle(.red)
                    .bold()
            }
        }
    }
    
    
    let formatter = DateFormatter()
        
        func month(for number: Int) -> String {
            formatter.shortStandaloneMonthSymbols[number - 1]
        }
}

#Preview {
    ExpensesDetailGridView(expensesViewModel: .preview)
        .padding(.trailing, 5)
}
