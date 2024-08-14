//
//  Sales.swift
//  ChartsPro
//
//  Created by Olibo moni on 11/08/2024.
//

import Foundation

struct Sale: Identifiable, Equatable {
    let id: UUID
    let book: Book
    let quantity: Int
    let saleDate: Date
    
    static var example = Sale(id: UUID(),
                              book: Book.examples[0],
                              quantity: 5,
                              saleDate: Date(timeIntervalSinceNow: -7_200_000))
    
    static var examples = [
        Sale(id: UUID(), book: Book.examples[0], quantity: 5, saleDate: Date(timeIntervalSinceNow: -7_200_000)),
        Sale(id: UUID(), book: Book.examples[1], quantity: 3, saleDate: Date(timeIntervalSinceNow: -14_400_000)),
        Sale(id: UUID(), book: Book.examples[2], quantity: 6, saleDate: Date(timeIntervalSinceNow: -21_600_000)),
        Sale(id: UUID(), book: Book.examples[3], quantity: 4, saleDate: Date(timeIntervalSinceNow: -28_800_000)),
        Sale(id: UUID(), book: Book.examples[4], quantity: 2, saleDate: Date(timeIntervalSinceNow: -36_000_000)),
        Sale(id: UUID(), book: Book.examples[5], quantity: 3, saleDate: Date(timeIntervalSinceNow: -43_200_000)),
        Sale(id: UUID(), book: Book.examples[6], quantity: 5, saleDate: Date(timeIntervalSinceNow: -50_400_000)),
        Sale(id: UUID(), book: Book.examples[7], quantity: 6, saleDate: Date(timeIntervalSinceNow: -57_600_000)),
        Sale(id: UUID(), book: Book.examples[8], quantity: 3, saleDate: Date(timeIntervalSinceNow: -64_800_000)),
        Sale(id: UUID(), book: Book.examples[9], quantity: 4, saleDate: Date(timeIntervalSinceNow: -72_000_000))
    ]
    
    static func threeMonthsExamples() -> [Sale]  { 
        let threeMonthsAgo = Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        let exampleSales: [Sale] = (1...300).map { _ in
            let randomBook = Book.examples.randomElement()!
            let randomQuantity = Int.random(in: 1...5)
            let randomDate = Date.random(in: threeMonthsAgo ... Date())
            return Sale(id: UUID(), book: randomBook, quantity: randomQuantity, saleDate: randomDate)
        }
        
        return exampleSales.sorted(by: {$0.saleDate < $1.saleDate})
        
    }
    
    
}

extension Date {
    static func random(in range: ClosedRange<Date>) -> Date{
        let diff = range.upperBound.timeIntervalSinceReferenceDate - range.lowerBound.timeIntervalSinceReferenceDate
        let randomValue = diff * Double.random(in: 0...1) + range.lowerBound.timeIntervalSinceReferenceDate
        return Date(timeIntervalSinceReferenceDate: randomValue)
        
    }
}

