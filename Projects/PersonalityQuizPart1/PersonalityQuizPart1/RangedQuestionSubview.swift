//
//  RangedQuestionSubview.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI
import Foundation

struct RangedQuestionSubview: View {
    @State var value: Double = 1
    @State var answer: String = "Not at all"
    @Environment(QuizManager.self) var quizManager
    
    func displaySavedSlider() {
        value = quizManager
            .questionList[quizManager.currentQuestion].savedSliderValue
    }
    
    func sliderSwitch(){
        switch Int(value) {
        case 1:
            answer = quizManager.questionList[quizManager.currentQuestion].answers[0].text
            quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [quizManager.questionList[quizManager.currentQuestion].answers[0].type]
        case 2:
            answer = quizManager.questionList[quizManager.currentQuestion].answers[1].text
            quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [quizManager.questionList[quizManager.currentQuestion].answers[1].type]
        case 3:
            answer = quizManager.questionList[quizManager.currentQuestion].answers[2].text
            quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [quizManager.questionList[quizManager.currentQuestion].answers[2].type]
        case 4:
            answer = quizManager.questionList[quizManager.currentQuestion].answers[3].text
            quizManager.questionList[quizManager.currentQuestion].savedAnswerType = [quizManager.questionList[quizManager.currentQuestion].answers[3].type]
        default:
            answer = ""
        }
    }
    
    var body: some View {
        @Bindable var quizManager = quizManager
        let current = quizManager.questionList[quizManager.currentQuestion]
            VStack {
                ScrollView {
                    Text(current.text)
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
                        quizManager.questionList[quizManager.currentQuestion].savedSliderValue = value
                    }
                }
                .scrollContentBackground(.hidden)
                Spacer()
                }
            .onAppear(perform: displaySavedSlider)
            }
        }

