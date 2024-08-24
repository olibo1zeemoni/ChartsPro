//
//  ContentView.swift
//  ChartsPro
//
//  Created by Olibo moni on 09/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var salesViewModel = SalesViewModel.preview
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        DetailBookSalesView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                        
                    } label: {
                        SimpleBookSalesView(salesViewModel: salesViewModel)
                    }
                }
                
                Section{
                    NavigationLink {
                        SalesByWeekdayView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleSalesByWeekdayView(salesViewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        SalesPerBookCategoryView(salesViewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SimpleSalesPerBookCategoryView(salesViewModel: salesViewModel)
                    }

                }
                
            }
            .navigationTitle("Your Book Store Stats")
            
        }
    }
}

#Preview {
    ContentView()
}
