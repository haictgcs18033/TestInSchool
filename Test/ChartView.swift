//
//  ChartView.swift
//  Test
//
//  Created by cmStudent on 2024/07/17.
//

import SwiftUI
import Charts
struct Product:Identifiable{
    let id = UUID()
    let title:String
    let revenue:Double
}
struct ChartView: View {
    @State private var products:[Product] = [
        .init(title: "Annualya", revenue: 7),
        .init(title: "Monthly", revenue: 2),
        .init(title: "Weekly", revenue: 1)
    ]
    @State private var selectedAngle: Int?

    var body: some View {
       
        VStack{
            Chart(products){ product in
                SectorMark(
                    angle: .value(
                    product.title, product.revenue
                    ),
                    innerRadius: .ratio(0.6),
                    angularInset: 2
                )
                .cornerRadius(5)
                .foregroundStyle(
                    by: .value(
                        Text(verbatim: product.title),
                        product.title
                    ))
            }
            .scaledToFit()
            .chartLegend(alignment: .center, spacing: 16)
            .chartBackground{chartProxy in
                GeometryReader{geometry in
                    if let anchor = chartProxy.plotFrame{
                        let frame = geometry[anchor]
                        Text("Catego")
                            .position(x: frame.midX,y: frame.midY)
                    }
                }
               
            }
            .chartAngleSelection(value: $selectedAngle)
            .onChange(of: selectedAngle) { oldValue, newValue in
                if let newValue{
                    print("asssss \(oldValue)")
                }
            }
        }
        .padding()
        .font(.system(size: 30))
        
    }
}

#Preview {
    ChartView()
}
