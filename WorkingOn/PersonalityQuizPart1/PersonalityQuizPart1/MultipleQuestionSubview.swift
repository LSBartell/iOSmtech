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
    @Binding var quizManager: QuizManager
    
    var body: some View {
        let current = quizManager.questionList[quizManager.currentQuestion]
                VStack {
                    ScrollView {
                        Text(quizManager.questionList[quizManager.currentQuestion].text)
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
                            Toggle(current.answers[0].text,isOn: $answer1)
                                .onChange(of: answer1) {
                                    if answer1 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType.append(quizManager.questionList[quizManager.currentQuestion].answers[0].type)
                                    } else {
                                        if let index = quizManager.questionList[quizManager.currentQuestion].savedAnswerType.firstIndex(of: current.answers[0].type) {
                                            quizManager.questionList[quizManager.currentQuestion].savedAnswerType.remove(at: index)
                                        }
                                    }
                                }
                        .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion].answers[1].text,isOn: $answer2)
                                .onChange(of: answer2) {
                                    if answer2 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType.append(quizManager.questionList[quizManager.currentQuestion].answers[1].type)
                                    } else {
                                        if let index = quizManager.questionList[quizManager.currentQuestion].savedAnswerType.firstIndex(of: current.answers[1].type) {
                                            quizManager.questionList[quizManager.currentQuestion].savedAnswerType.remove(at: index)
                                        }
                                    }
                                }
                        .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion].answers[2].text,isOn: $answer3)
                                .onChange(of: answer3) {
                                    if answer3 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType.append(quizManager.questionList[quizManager.currentQuestion].answers[2].type)
                                    } else {
                                        if let index = quizManager.questionList[quizManager.currentQuestion].savedAnswerType.firstIndex(of: current.answers[2].type) {
                                            quizManager.questionList[quizManager.currentQuestion].savedAnswerType.remove(at: index)
                                        }
                                    }
                                }
                        .padding(5)
                            Toggle(quizManager.questionList[quizManager.currentQuestion].answers[3].text,isOn: $answer4)
                                .onChange(of: answer4) {
                                    if answer4 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType.append(quizManager.questionList[quizManager.currentQuestion].answers[3].type)
                                    } else {
                                        if let index = quizManager.questionList[quizManager.currentQuestion].savedAnswerType.firstIndex(of: current.answers[3].type) {
                                            quizManager.questionList[quizManager.currentQuestion].savedAnswerType.remove(at: index)
                                        }
                                    }
                                }
                        .padding(5)
                        } header: {
                            Text("Pick any that apply")
                        }
            }
                    .scrollContentBackground(.hidden)
                }
            }
        }
