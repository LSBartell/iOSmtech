//
//  SingleQuestionSubview.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @State var answer1 = false
    @State var answer2 = false
    @State var answer3 = false
    @State var answer4 = false
    @Binding var quizManager: QuizManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        Text(quizManager.questionList[quizManager.currentQuestion - 1].text)
                            .padding(5)
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
                            Toggle(quizManager.questionList[quizManager.currentQuestion - 1].answers[0].text,isOn: $answer1)
                                .onChange(of: answer1) {
                                    if answer1 {
                                        answer2 = false
                                        answer3 = false
                                        answer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion - 1].answers[1].text,isOn: $answer2)
                                .onChange(of: answer2) {
                                    if answer2 {
                                        answer1 = false
                                        answer3 = false
                                        answer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion - 1].answers[2].text,isOn: $answer3)
                                .onChange(of: answer3) {
                                    if answer3 {
                                        answer1 = false
                                        answer2 = false
                                        answer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion - 1].answers[3].text,isOn: $answer4)
                                .onChange(of: answer4) {
                                    if answer4 {
                                        answer1 = false
                                        answer2 = false
                                        answer3 = false
                                    }
                                }
                                .padding(5)
                        } header: {
                            Text("Pick one")
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {quizManager.currentQuestion += 1}) {
                                Image(systemName: "chevron.right")
                            }
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {}) {
                                Image(systemName: "chevron.left")
                            }
                        }
                    }
                }
            }
        }
    }
}

