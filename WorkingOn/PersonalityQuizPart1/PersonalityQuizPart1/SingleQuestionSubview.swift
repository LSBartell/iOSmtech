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
    @Environment(QuizManager.self) var quizManager
    
    func displaySavedAnswers() {
        answer1 = quizManager.questionList[quizManager.currentQuestion].savedAnswer1
        answer2 = quizManager.questionList[quizManager.currentQuestion].savedAnswer2
        answer3 = quizManager.questionList[quizManager.currentQuestion].savedAnswer3
        answer4 = quizManager.questionList[quizManager.currentQuestion].savedAnswer4
    }
    var body: some View {
        @Bindable var quizManager = quizManager
        let current = quizManager.questionList[quizManager.currentQuestion]
                VStack {
                    ScrollView {
                        Text(current.text)
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
                            Toggle(current.answers[0].text,isOn: $answer1)
                                .onChange(of: answer1) {
                                    if answer1 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [current.answers[0].type]
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer1 = true
                                        answer2 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer2 = false
                                        answer3 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer3 = false
                                        answer4 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(current.answers[1].text,isOn: $answer2)
                                .onChange(of: answer2) {
                                    if answer2 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [current.answers[1].type]
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer2 = true
                                        answer1 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer1 = false
                                        answer3 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer3 = false
                                        answer4 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(current.answers[2].text,isOn: $answer3)
                                .onChange(of: answer3) {
                                    if answer3 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [current.answers[2].type]
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer3 = true
                                        answer1 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer1 = false
                                        answer2 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer2 = false
                                        answer4 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer4 = false
                                    }
                                }
                                .padding(5)
                            Toggle(current.answers[3].text,isOn: $answer4)
                                .onChange(of: answer4) {
                                    if answer4 {
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [current.answers[3].type]
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer4 = true
                                        answer1 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer1 = false
                                        answer2 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer2 = false
                                        answer3 = false
                                        quizManager.questionList[quizManager.currentQuestion].savedAnswer4 = false
                                    }
                                }
                                .padding(5)
                        } header: {
                            Text("Pick one")
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                .onAppear(perform: displaySavedAnswers)
            }
        }

