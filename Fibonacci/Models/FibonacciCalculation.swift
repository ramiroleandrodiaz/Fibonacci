//
//  FibonacciResult.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 09/07/2025.
//
import Foundation
import QuartzCore

// I know I could've used Date instead of a Custom framework like QuartzCore
// But since this is a small part of the project, I used QuartzCore which is recommended for partial short calculations

struct FibonacciCalculation: Identifiable {
  
  // Identifiable and has UUID since will show in a list.
  let id = UUID()
  let n: Int
  let sequence: [FibonacciResult]
  let calculationTime: Double // In milliseconds
    
  static func calculate(for n: Int) -> FibonacciCalculation {
    let startTime = CACurrentMediaTime()
        
    var sequence: [FibonacciResult] = []
    var prev = 0
    var current = 1

    // By Fibonacci's Definition F(0) = 0 & F(1) = 1
    // So we add those sequences
    sequence.append(FibonacciResult(index: 0, value: 0))
    if n >= 1 {
      sequence.append(FibonacciResult(index: 1, value: 1))
    }
        
    // Then we apply Fibonacci as the Sum of the last two numbers.
    if n >= 2 {
      for i in 2...n {
        let next = prev + current
        sequence.append(FibonacciResult(index: i, value: next))
        prev = current
        current = next
      }
    }
    
        
    let endTime = CACurrentMediaTime()
    let calculationTime = (endTime - startTime) * 1000 // Converting to milliseconds
        
    return FibonacciCalculation(n: n, sequence: sequence, calculationTime: calculationTime)
  }
}
