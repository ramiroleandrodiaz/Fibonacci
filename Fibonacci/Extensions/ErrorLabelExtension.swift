//
//  ErrorLabelExtension.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI

extension View {
  func errorLabelStyle() -> some View {
    modifier(ErrorLabelModifier())
  }
}
