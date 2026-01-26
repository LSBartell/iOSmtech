//
//  ContentView.swift
//  ClothingLab
//
//  Created by Logan Steven Bartell on 1/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                Section("Hats") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(hats, id: \.self) { hat in
                                clothingView(clothing: hat, length: geometry.size.width)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                Section("Shirts") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(
                            rows: [
                                GridItem(.fixed(geometry.size.width / 4)),
                                GridItem(.fixed(geometry.size.width / 4))
                            ]
                        ) {
                            ForEach(shirts, id: \.self) { shirt in
                                clothingView(clothing: shirt, length: geometry.size.width)
                            }
                        }
                    }
                }
                Section("Pants") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(
                            rows: [
                                GridItem(.adaptive(minimum: geometry.size.width / 4, maximum: .infinity)),
                                GridItem(.adaptive(minimum: geometry.size.width / 4, maximum: .infinity)),
                                GridItem(.adaptive(minimum: geometry.size.width / 4, maximum: .infinity)),
                                GridItem(.adaptive(minimum: geometry.size.width / 4, maximum: .infinity))
                            ]
                        ) {
                            ForEach(pants, id: \.self) { pant in
                                clothingView(clothing: pant, length: geometry.size.width)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct clothingView: View {
    var clothing: Clothing
    var length: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.random())
                .frame(width: length / 4, height: length / 4)
            VStack {
                Text(clothing.name)
                Text("$\(clothing.price.formatted())")
                    .font(.footnote)
                Text(clothing.color)
                    .font(.caption)
            }
        }
    }
}

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}

#Preview {
    ContentView()
}
