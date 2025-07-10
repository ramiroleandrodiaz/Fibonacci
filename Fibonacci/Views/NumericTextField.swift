//
//  NumericTextField.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI
import Combine

// Created this class to demonstrate use of combine. I could use give the value of the textfield and int,
// but this would defeat the purpose of testing this out.

struct NumericTextfield: View {
  
  @Binding var input: String
  
  var textfieldPrompt: String = "Enter value"
  
  var body: some View {
    TextField(textfieldPrompt, text: $input)
      .keyboardType(.numberPad)
      .onReceive(Just(input)) { newValue in
      let filtered = newValue.filter { "0123456789".contains($0) }
      if filtered != newValue {
        self.input = filtered
      }
    }
  }
}

#Preview {
  struct Preview: View {
      @State var input = ""
      var body: some View {
        NumericTextfield(input: $input, textfieldPrompt: "Enter Fibonacci Value")
      }
  }
  return Preview()
}
