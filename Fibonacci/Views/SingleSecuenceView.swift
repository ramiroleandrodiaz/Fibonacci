//
//  SingleSecuenceView.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI

// Small class to clean up code when displaying the Fibonacci Sequence

struct SingleSecuenceView: View {
  
  var singleFibonacciElemet: FibonacciResult
  
  var body: some View {
    HStack {
      Text("\(singleFibonacciElemet.index)")
      Spacer()
      Text("\(singleFibonacciElemet.value)")
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
  }
}
