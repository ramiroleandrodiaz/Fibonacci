//
//  ResultsView.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 09/07/2025.
//

import SwiftUI

struct ResultsView: View {
  
  let calculations: [FibonacciCalculation]

  var body: some View {
    if calculations.isEmpty {
      Group {
        Text(" No Calculations to show.")
          .font(.headline)
        Text("Go back and start calculating some Fibonacci numbers!")
          .font(.subheadline)
      }
      .padding()
    } else {
      List {
        Section(header: TwoColumnHeaderView(title: "Fibonacci Calculations",
                                              leftColumnTitle: "N",
                                              rightColumnTitle: "Time (ms)")) {
          ForEach(calculations) { calculation in
            SingleCalculationView(singleFibonacciCalculation: calculation)
          }
        }
      }
      .listStyle(.plain)
    }
  }
}

#Preview {
//    ResultsView(calculations: [FibonacciCalculation(n: 1, sequence: [], calculationTime: 13),
//                              FibonacciCalculation(n: 2, sequence: [], calculationTime: 10)])
  ResultsView(calculations: [])
}
