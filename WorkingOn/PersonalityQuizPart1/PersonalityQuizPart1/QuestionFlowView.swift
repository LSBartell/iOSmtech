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
                                .foregroundStyle(.orange)
                                .glassEffect(.clear)
                        }
                    }
                }
                .padding()
                switch quizManager.currentQuestion {
                case 1:
                    SingleQuestionSubview(quizManager: $quizManager)
                case 2:
                    MultipleQuestionSubview()
                default:
                    RangedQuestionSubview()
                }
            }
        }
    }
}

#Preview {
    QuestionFlowView()
}
