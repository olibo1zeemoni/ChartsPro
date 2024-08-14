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
    
    init() {
        //do something
    }
    
    func salesGroupedByWeek(sales: [Sale]) -> [Date: [Sale]] {
        var salesByWeek: [Date: [Sale]] = [:]
        
        let calendar = Calendar.current
        for sale in sales {
            guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: sale.saleDate)) else { continue }
            if salesByWeek[startOfWeek] != nil {
                salesByWeek[startOfWeek]!.append(sale)
            } else {
                salesByWeek[startOfWeek] = [sale]
            }
        }
        
        return salesByWeek
    }
    
    static var preview: SalesViewModel {
        let vm = SalesViewModel()
        vm.salesData = Sale.examples
        return vm
    }
    
}
