//
//  ResultsView.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI

struct ResultsView: View {
    @Environment(QuizManager.self) var quizManager
    @State var resultsViewModel: ResultsViewModel? = nil
    
    var body: some View {
        ZStack {
            Image("TitleImage")
                .resizable()
                .scaledToFill()
                .frame(height: 900)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 100)
                Text(resultsViewModel?.quizAnswer ?? "")
                    .font(.custom("Copperplate", size: 55))
                    .bold()
                    .foregroundStyle(Gradient(colors: [.white, .gray]))
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(.clear)
                            .foregroundStyle(.orange)
                    )
                Text(resultsViewModel?.answerDescription ?? "")
                    .frame(width: 350)
                    .font(.custom("Copperplate", size: 20))
                    .foregroundStyle(.white)
                    .bold()
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .glassEffect(.clear)
                    )
                Spacer()
                    .frame(height: 200)
            }
        }
        .onAppear {
            resultsViewModel = ResultsViewModel(quizManager: quizManager)
            resultsViewModel?.getMostCommonAnswer()
        }
    }
}

