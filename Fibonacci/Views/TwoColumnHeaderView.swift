//
//  TwoColumnHeaderView.swift
//  Fibonacci
//
//  Created by Ramiro Diaz on 10/07/2025.
//

import SwiftUI

// Simple Header with a main title and names for 2 columns

struct TwoColumnHeaderView: View {
  var title: String = ""
  var leftColumnTitle: String = ""
  var rightColumnTitle: String = ""
  
  var body: some View {
    VStack {
      Text(title)
      HStack {
        Text(leftColumnTitle)
        Spacer()
        Text(rightColumnTitle)
      }
    }
  }
}
