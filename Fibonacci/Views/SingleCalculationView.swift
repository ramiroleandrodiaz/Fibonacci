//
//  SingleCalculationView.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI

// Small class to clean up code when displaying the Fibonacci Calculation

struct SingleCalculationView: View {
  
  var singleFibonacciCalculation: FibonacciCalculation
  
  var body: some View {
    HStack {
      Text("\(singleFibonacciCalculation.n)")
      Spacer()
      Text(String(format: "%.4f", singleFibonacciCalculation.calculationTime))
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
  }
}
