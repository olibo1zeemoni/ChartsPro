//
//  ExpensesViewModel.swift
//  ChartsPro
//
//  Created by Olibo moni on 25/08/2024.
//

import Foundation
import Combine


class ExpensesViewModel: ObservableObject {
    @Published private var expenses: [Expense] = []
    @Published var monthlyExpenseData: [ExpenseStats] = []
    @Published var totalExpenses: Double = 0
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    
    init(){
        //TODO: fetch data
        ///unowned self performant; does not increase reference count; must not be nil else runtime crash.
        $expenses.sink { [unowned self]  expenses in
            let fixedExpenses = expensesByMonth(for: .fixed, expenses: expenses)
            let variableExpense = expensesByMonth(for: .variable, expenses: expenses)
            monthlyExpenseData = calculateTotalMonthlyExpenses(fixedExpenses: fixedExpenses, variableExpense: variableExpense)
            totalExpenses = calculateTotal(expenses: expenses)
            
        }.store(in: &subscriptions)
        
    }
    
    
    func calculateTotal(expenses: [Expense]) -> Double {
        expenses.reduce(0, {$0 + $1.amount})
    }
    
    func expensesByMonth(for category: ExpenseCategory, expenses: [Expense]) -> [(month: Int, amount: Double)] {
        let calendar = Calendar.current
        var expensesByMonth: [Int: Double] = [:]
        
        for expense in expenses where expense.category == category {
            let month = calendar.component(.month, from: expense.expenseDate)
            expensesByMonth[month, default: 0] += expense.amount
        }
        
        let result = expensesByMonth.map { (month: $0.key, amount: $0.value) }
        
        return result.sorted { $0.month < $1.month }
    }
    
    func calculateTotalMonthlyExpenses(fixedExpenses: [(month: Int, amount: Double)], variableExpense: [(month: Int, amount: Double)]) -> [ExpenseStats] {
        var result = [ExpenseStats]()
        let count = min(fixedExpenses.count, variableExpense.count)
        
        for index in 0..<count {
            let month = fixedExpenses[index].month
            result.append(ExpenseStats(month: month, fixedExpenses: fixedExpenses[index].amount, variableExpenses: variableExpense[index].amount))
        }
        
        return result
    }
    
    static var preview: ExpensesViewModel {
        let vm = ExpensesViewModel()
        vm.expenses = Expense.yearExamples
        return vm
    }
    
}


struct ExpenseStats: Identifiable {
    let month: Int
    let fixedExpenses: Double
    let variableExpenses: Double
    var totalExpenses: Double {
        fixedExpenses + variableExpenses
    }
    
    var id: Int { return month }
}
