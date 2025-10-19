//
//  QuestionFlowView.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI


struct QuestionFlowView: View {
    @State var quizManager = QuizManager()
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        ForEach($quizManager.questionList) { question in
                            if question.questionNumber.wrappedValue == quizManager.currentQuestion {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 10)
                                    .foregroundStyle(.orange)
                                    .glassEffect()
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 5)
                                    .foregroundStyle(.orange.opacity(0.5))
                                    .glassEffect(.clear)
                            }
                        }
                    }
                    .padding()
                    switch quizManager.questionList[quizManager.currentQuestion].type {
                    case .single:
                        SingleQuestionSubview(quizManager: $quizManager)
                    case .multiple:
                        MultipleQuestionSubview(quizManager: $quizManager)
                    case .ranged:
                        RangedQuestionSubview(quizManager: $quizManager)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if quizManager.currentQuestion < (quizManager.questionList.count - 1) {
                        Button {
                            quizManager.currentQuestion += 1
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    if quizManager.currentQuestion > 0 {
                        Button(action: {
                            print("Hit")
                            quizManager.currentQuestion -= 1
                            print(quizManager.currentQuestion)
                        }) {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(quizManager.currentQuestion > 0)
        }
    }
}

#Preview {
    QuestionFlowView()
}
