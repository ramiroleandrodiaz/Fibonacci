//
//  ErrorLabelModifier.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI

// Added a Modifier for error label for repeated style. Then using protocol oriented programming, I extended the view for preferred use.

struct ErrorLabelModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
      .font(.caption)
  }
}
