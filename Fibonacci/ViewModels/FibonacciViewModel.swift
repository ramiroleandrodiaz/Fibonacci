//
//  FibonacciViewModel.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 09/07/2025.
//

import Foundation
import SwiftUI
import Combine

class FibonacciViewModel: ObservableObject {
  @Published var inputNumber: String = ""
  @Published var currentCalculation: FibonacciCalculation?
  @Published var allCalculations: [FibonacciCalculation] = []
    
  // We limit the input number to be below 90 to avoid arithmetic overflows for this simple example
  
  func calculateFibonacci() {
    guard let n = Int(inputNumber), n >= 0, n <= 90 else { return }
            
    let calculation = FibonacciCalculation.calculate(for: n)
    currentCalculation = calculation
    allCalculations.append(calculation)
    inputNumber = "" // Reset input field
  }
  
  func isValidInput(_ input: String) -> Bool {
      if input.isEmpty { return true }
      guard let number = Int(input) else { return false }
      return number >= 0 && number <= 90
  }
}
