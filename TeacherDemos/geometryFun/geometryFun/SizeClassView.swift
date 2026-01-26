//
//  SizeClassView.swift
//  geometryFun
//
//  Created by Logan Steven Bartell on 1/6/26.
//

import SwiftUI

struct SizeClassView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticlaSizeClass
    
    var frameWidthDivisor: CGFloat {
        if verticlaSizeClass == .compact {
            return 2
        } else {
            return 3
        }
    }
    
    var body: some View {
        VStack {
            if horizontalSizeClass == .compact {
                Text("Horizontal: Compact")
            } else {
                Text("Horizontal: Regular")
            }
            
            if verticlaSizeClass == .compact {
                Text("Vertical: Compact")
            } else {
                Text("Vertical: Regular")
            }
            
            GeometryReader { geometry in
                Rectangle()
                    .fill(.cyan)
                    .frame(width: geometry.size.width / frameWidthDivisor)
            }
        }
    }
}

#Preview {
    SizeClassView()
}
