//
//  SalesViewModel.swift
//  ChartsPro
//
//  Created by Olibo moni on 14/08/2024.
//

import Foundation

class SalesViewModel: ObservableObject {
    @Published var salesData = [Sale]()
    
    var totalSales: Int {
        salesData.reduce(0){ $0 + $1.quantity}
    }
    
    @Published var lastTotalSales: Int = 0
    
    var salesByWeek:[(day: Date, sales: Int)] {
            let salesByWeek = salesGroupedByWeek(sales: salesData)
            return totalSalesPerDate(salesByDate: salesByWeek)
        }
    
    init() {
        //do something
    }
    
    func salesGroupedByWeek(sales: [Sale]) -> [Date: [Sale]] {
        var salesByWeek: [Date: [Sale]] = [:]
        
        let calendar = Calendar.current
        for sale in sales {
            ///week of year is the week number within the year; essentially finding the start of the week that contains our original date
            guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: sale.saleDate)) else { continue }
            
            if salesByWeek[startOfWeek] != nil {
                salesByWeek[startOfWeek]!.append(sale)
            } else {
                salesByWeek[startOfWeek] = [sale]
            }
        }
        
        return salesByWeek
    }
    
    func totalSalesPerDate(salesByDate: [Date: [Sale]]) -> [(day: Date, sales: Int)] {
           var totalSales: [(day: Date, sales: Int)] = []
           
           for (date, sales) in salesByDate {
               let totalQuantityForDate = sales.reduce(0) { $0 + $1.quantity }
               totalSales.append((day: date, sales: totalQuantityForDate))
           }
           
           return totalSales
       }
    
    static var preview: SalesViewModel {
        let vm = SalesViewModel()
        vm.salesData = Sale.threeMonthsExamples()
        vm.lastTotalSales = 2000
        return vm
    }
    
}
