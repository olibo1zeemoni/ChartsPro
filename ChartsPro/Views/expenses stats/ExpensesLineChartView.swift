//
//  ExpensesLineChartView.swift
//  ChartsPro
//
//  Created by Olibo moni on 25/08/2024.
//

import SwiftUI
import Charts

struct ExpensesLineChartView: View {
    @ObservedObject var expensesViewModel: ExpensesViewModel
    let linearGradient = LinearGradient(colors: [.purple.opacity(0.7), .purple.opacity(0.1)], startPoint: .top, endPoint: .bottom)

    var body: some View {
        Chart(expensesViewModel.monthlyExpenseData) { data in
            
            Plot {
                LineMark(x: .value("month", data.month), y: .value("expenses", data.fixedExpenses))
                    .foregroundStyle(by: .value("Expenses", "fixed"))
                    .symbol(by: .value("Expenses", "fixed"))
                
                
//                AreaMark(x: .value("month", data.month), y: .value("expenses", data.fixedExpenses))
//                    .foregroundStyle(linearGradient)
                    
                
                
                LineMark(x: .value("month", data.month), y: .value("expenses", data.variableExpenses))
                    .foregroundStyle(by: .value("Expenses", "variable"))
                    .symbol(by: .value("Expenses", "variable"))
            }
            .lineStyle(StrokeStyle(lineWidth: 2))
            .interpolationMethod(.catmullRom)
            
        }
        .aspectRatio(1, contentMode: .fit)
        .chartForegroundStyleScale(["fixed": .purple, "variable": .cyan])
        .chartSymbolScale(["fixed": Square().strokeBorder(lineWidth: 2),
                           "variable": Triangle().strokeBorder(lineWidth: 2)])
        .chartXScale(domain: 1...13)
        .chartXAxis {
            AxisMarks(values: [1,4,7,12]) { value in
                AxisGridLine()
                AxisTick()
                if let number = value.as(Int.self) {
                    AxisValueLabel(month(for: number), centered: true, anchor: .topLeading)
                }
            }
        }
        .chartYAxis {
            AxisMarks { value in
                AxisGridLine()
                AxisTick()
                if let number = value.as(Double.self) {
                    AxisValueLabel("\(Int(number)/1000) k")
                }
            }
        }
    }
    
    let formatter = DateFormatter()
    
    func month(for number: Int) -> String {
        formatter.shortStandaloneMonthSymbols[number - 1]
    }
}


#Preview {
    ExpensesLineChartView(expensesViewModel: .preview)
        .padding()
}



/// A square symbol for charts.
struct Square: ChartSymbolShape, InsettableShape {
    let inset: CGFloat

    init(inset: CGFloat = 0) {
        self.inset = inset
    }

    func path(in rect: CGRect) -> Path {
        let cornerRadius: CGFloat = 1
        let minDimension = min(rect.width, rect.height)
        return Path(
            roundedRect: .init(x: rect.midX - minDimension / 2, y: rect.midY - minDimension / 2, width: minDimension, height: minDimension),
            cornerRadius: cornerRadius
        )
    }

    func inset(by amount: CGFloat) -> Square {
        Square(inset: inset + amount)
    }

    var perceptualUnitRect: CGRect {
        // The width of the unit rectangle (square). Adjust this to
        // size the diamond symbol so it perceptually matches with
        // the circle.
        let scaleAdjustment: CGFloat = 0.75
        return CGRect(x: 0.5 - scaleAdjustment / 2, y: 0.5 - scaleAdjustment / 2, width: scaleAdjustment, height: scaleAdjustment)
    }
}

struct Triangle: ChartSymbolShape, InsettableShape {
    let inset: CGFloat
    
    init(inset: CGFloat = 0) {
        self.inset = inset
    }
    
    func path(in rect: CGRect) -> Path {
        let minDimension = min(rect.width, rect.height)
        let triangleSize = minDimension - 2 * inset
        
        let topPoint = CGPoint(x: rect.midX, y: rect.midY - triangleSize / 2)
        let bottomLeftPoint = CGPoint(x: rect.midX - triangleSize / 2, y: rect.midY + triangleSize / 2)
        let bottomRightPoint = CGPoint(x: rect.midX + triangleSize / 2, y: rect.midY + triangleSize / 2)
        
        var path = Path()
        path.move(to: topPoint)
        path.addLine(to: bottomRightPoint)
        path.addLine(to: bottomLeftPoint)
        path.closeSubpath()
        
        return path
    }
    
    func inset(by amount: CGFloat) -> Triangle {
        Triangle(inset: inset + amount)
    }
    
    var perceptualUnitRect: CGRect {
        // The width of the unit rectangle (triangle). Adjust this to
        // size the triangle symbol so it perceptually matches with
        // the circle and square.
        let scaleAdjustment: CGFloat = 0.75
        return CGRect(x: 0.5 - scaleAdjustment / 2, y: 0.5 - scaleAdjustment / 2, width: scaleAdjustment, height: scaleAdjustment)
    }
}


