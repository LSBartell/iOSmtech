//
//  ContentView.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 8/27/25.
//

import SwiftUI

struct MyView: View {
  var body: some View {
      Text("Hello World")
          .myModifier()
      Text("Another one")
          .myNewModifier()
  }
}

#Preview {
    MyView()
}
