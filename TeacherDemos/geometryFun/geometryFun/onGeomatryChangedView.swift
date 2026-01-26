//
//  onGeomatryChangedView.swift
//  geometryFun
//
//  Created by Logan Steven Bartell on 1/6/26.
//

import SwiftUI

struct onGeomatryChangedView: View {
    @State private var text = ""
    @State private var textSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text(text)
                .onGeometryChange(for: CGSize.self) { geometry in
                    geometry.size
                } action: { newValue in
                    textSize = newValue
                }
            
            Rectangle()
                .fill(Color.black)
                .frame(width: textSize.width, height: 5)
            
            TextField("Type here", text: $text)
        }
    }
}

#Preview {
    onGeomatryChangedView()
}
