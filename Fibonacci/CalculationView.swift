//
//  ContentView.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 09/07/2025.
//

import SwiftUI

struct CalculationView: View {
  
  @StateObject private var viewModel = FibonacciViewModel()
  @FocusState private var isInputFocused: Bool
  @State private var goToSummary = false
  
    var body: some View {
      NavigationStack {
        VStack {
          VStack {
            NumericTextfield(input: $viewModel.inputNumber, textfieldPrompt: "Enter a number between 0 and 90.")
              .focused($isInputFocused)
              .textFieldStyle(.roundedBorder)
              .padding()
              .overlay {
                RoundedRectangle(cornerRadius: 8)
                  .stroke(!viewModel.isValidInput(viewModel.inputNumber) ? Color.red : Color.clear, lineWidth: 2)
                  .padding()
              }
              .toolbar {
                ToolbarItem(placement: .keyboard) {
                  Button("Done") {
                    isInputFocused = false
                    viewModel.calculateFibonacci()
                  }
                }
              }
            
            // Display Error Case
            if !viewModel.isValidInput(viewModel.inputNumber) && !viewModel.inputNumber.isEmpty {
              Text("Please enter a valid number between 0 and 90")
                .foregroundColor(.red)
                .font(.caption)
                .padding(.horizontal)
            }
          }
          
          if let calculation = viewModel.currentCalculation {
            // Display Fibonacci sequence list
            List {
              Section(header: TwoColumnHeaderView(title: "Fibonacci Sequence",
                                                  leftColumnTitle: "N",
                                                  rightColumnTitle: "F(N)")) {
                ForEach(calculation.sequence, id: \.index) { item in
                  SingleSecuenceView(singleFibonacciElemet: item)
                }
              }
            }
            .listStyle(.plain)
            
            // Calculation time
            Text(String(format: "Calculation time: %.4f ms", calculation.calculationTime))
                .padding()
                .background(Color(.systemBackground))
          } else {
            // Accomodate everything to the Top
            Spacer()
          }
        }
          .navigationTitle("Fibonacci Calculator")
          .toolbar {
            Button("Summary") {
              goToSummary = true
            }
            .navigationDestination(isPresented: $goToSummary) {
              ResultsView(calculations: viewModel.allCalculations)
            }
          }
      }
    }
}

#Preview {
  CalculationView()
}
