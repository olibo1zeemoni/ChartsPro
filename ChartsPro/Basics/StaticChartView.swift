//
//  ContentView.swift
//  ChartsPro
//
//  Created by Olibo moni on 08/08/2024.
//

import SwiftUI
import Charts

struct StaticChartView: View {
    @State var averageIsShow = false
    
    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("Type", "bird"), y: .value("population", 1))
                    .opacity(0.5)
                
                BarMark(x: .value("Type", "dog"), y: .value("population", 2))
                    .opacity(0.5)
                
                BarMark(x: .value("Type", "cat"), y: .value("population", 3))
                    .opacity(0.5)
                
                BarMark(x: .value("Type", "cows"), y: .value("population", 4))
                
                if averageIsShow {
                    RuleMark(y: .value("Average", 1.5))
                        .foregroundStyle(.gray)
                        .annotation(position: .bottom, alignment: .leading) {
                            Text("Average 1.5")
                                .foregroundStyle(.red)
                    }
                }
                
            }
            .aspectRatio(1, contentMode: .fit)
            
            Toggle(isOn: $averageIsShow, label: {
                Text("show average")
            })
        }
        .padding()
    }
}

#Preview {
    StaticChartView()
}
