//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by Ramiro Diaz on 09/07/2025.
//

import Testing
@testable import Fibonacci

struct FibonacciTests {
  
  // MARK: - Calculation Tests

  @Test("Fibonacci calculation for n = 0 returns correct sequence")
  func testFibonacciCalculationForZero() async throws {
    let calculation = FibonacciCalculation.calculate(for: 0)
    #expect(calculation.sequence.count == 1)
    #expect(calculation.sequence[0].value == 0)
    #expect(calculation.n == 0)
  }
     
  @Test("Fibonacci calculation for n = 1 returns correct sequence")
  func testFibonacciCalculationForOne() async throws {
    let calculation = FibonacciCalculation.calculate(for: 1)
    #expect(calculation.sequence.count == 2)
    #expect(calculation.sequence[0].value == 0)
    #expect(calculation.sequence[1].value == 1)
    #expect(calculation.n == 1)
  }
     
  @Test("Fibonacci calculation for n = 5 returns correct sequence")
  func testFibonacciCalculationForFive() async throws {
    let calculation = FibonacciCalculation.calculate(for: 5)
    #expect(calculation.sequence.count == 6)
    #expect(calculation.sequence.map(\.value) == [0, 1, 1, 2, 3, 5])
    #expect(calculation.n == 5)
  }
     
  // MARK: - ViewModel Tests
     
  @Test("ViewModel initializes with correct initial state")
  func testViewModelInitialState() async throws {
    let viewModel = FibonacciViewModel()
    #expect(viewModel.inputNumber == "")
    #expect(viewModel.currentCalculation == nil)
    #expect(viewModel.allCalculations.isEmpty)
  }
     
  @Test("ViewModel validates input correctly")
  func testValidInput() async throws {
    let viewModel = FibonacciViewModel()
    
    // Valid inputs
    #expect(viewModel.isValidInput(""))  // Empty is valid
    #expect(viewModel.isValidInput("0"))
    #expect(viewModel.isValidInput("45"))
    #expect(viewModel.isValidInput("90"))
    
    // Invalid inputs
    #expect(!viewModel.isValidInput("-1"))
    #expect(!viewModel.isValidInput("91"))
    #expect(!viewModel.isValidInput("abc"))
  }
     
  @Test("ViewModel calculates Fibonacci sequence correctly")
  func testCalculateFibonacci() async throws {
    let viewModel = FibonacciViewModel()
    viewModel.inputNumber = "5"
    viewModel.calculateFibonacci()
    
    #expect(viewModel.currentCalculation != nil)
    #expect(viewModel.allCalculations.count == 1)
    #expect(viewModel.currentCalculation?.sequence.count == 6)
    #expect(viewModel.currentCalculation?.sequence.map(\.value) == [0, 1, 1, 2, 3, 5])
    #expect(viewModel.inputNumber == "") // Input should be reset
  }
     
  @Test("ViewModel handles invalid input correctly")
  func testCalculateFibonacciWithInvalidInput() async throws {
    let viewModel = FibonacciViewModel()
    viewModel.inputNumber = "abc"
    viewModel.calculateFibonacci()
    
    #expect(viewModel.currentCalculation == nil)
    #expect(viewModel.allCalculations.isEmpty)
  }
     
  @Test("ViewModel handles multiple calculations correctly")
  func testMultipleCalculations() async throws {
    let viewModel = FibonacciViewModel()
         
    viewModel.inputNumber = "2"
    viewModel.calculateFibonacci()
    viewModel.inputNumber = "3"
    viewModel.calculateFibonacci()
         
    #expect(viewModel.allCalculations.count == 2)
    #expect(viewModel.allCalculations[0].n == 2)
    #expect(viewModel.allCalculations[1].n == 3)
  }
     
  @Test("Calculation time is positive")
  func testCalculationTimeIsPositive() async throws {
    let viewModel = FibonacciViewModel()
    viewModel.inputNumber = "10"
    viewModel.calculateFibonacci()
         
    #expect(viewModel.currentCalculation?.calculationTime != nil)
    #expect(viewModel.currentCalculation?.calculationTime ?? 0 > 0)
  }

}
