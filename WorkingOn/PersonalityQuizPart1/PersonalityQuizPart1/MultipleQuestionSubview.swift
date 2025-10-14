//
//  MultipleQuestionSubview.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    @State var answer1 = false
    @State var answer2 = false
    @State var answer3 = false
    @State var answer4 = false
    
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
                    .frame(height: 200)
                    List {
                        Section {
                    Toggle("answer1",isOn: $answer1)
                        .padding(5)
                    Toggle("answer2",isOn: $answer2)
                        .padding(5)
                    Toggle("answer3",isOn: $answer3)
                        .padding(5)
                    Toggle("answer4",isOn: $answer4)
                        .padding(5)
                        } header: {
                            Text("Pick any that apply")
                        }
            }
                    .scrollContentBackground(.hidden)
                    .toolbar {
                        Button(action: {}) {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MultipleQuestionSubview()
}
