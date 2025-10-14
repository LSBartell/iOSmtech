//
//  RangedQuestionSubview.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI
import Foundation

struct RangedQuestionSubview: View {
    @State var value: Double = 0
    @State var answer: String = "Not at all"
    func sliderSwitch(){
        switch Int(value) {
        case 1:
            answer = "Not at all"
        case 2:
            answer = "A little"
        case 3:
            answer = "A fair amount"
        default:
            answer = "A lot"
        }
    }
    
    var body: some View {
        NavigationStack {
        ZStack {
            LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("Question")
                        .frame(width: 375)
                        .font(.custom("Copperplate", size: 35))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                        )
                    
                    }
                .frame(height: 450)
                List {
                    Section {
                        Slider(value: $value, in: 1...4.9)
                    } header: {
                        Text(answer)
                    }
                    .onChange(of: value) {
                        sliderSwitch()
                    }
                }
                .scrollContentBackground(.hidden)
                Spacer()
                }
            }
        .toolbar {
            Button(action: {}) {
                Image(systemName: "chevron.right")
                }
            }
        }
    }
}

#Preview {
    RangedQuestionSubview()
}
