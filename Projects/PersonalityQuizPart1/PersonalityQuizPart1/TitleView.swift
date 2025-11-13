//
//  ContentView.swift
//  PersonalityQuizPart1
//
//  Created by Logan Steven Bartell on 10/13/25.
//

import SwiftUI

struct TitleView: View {
    
    @State var quizManager = QuizManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("TitleImage")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 950)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("BATTLEFIELD")
                        .font(.custom("Copperplate", size: 55))
                        .bold()
                        .foregroundStyle(Gradient(colors: [.white, .gray]))
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .glassEffect(.clear)
                        )
                    Text("What is the best class for you?")
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
                    NavigationLink {
                        QuestionFlowView()
                    } label: {
                        Text("BEGIN")
                            .font(.custom("Copperplate", size: 40))
                            .bold()
                            .foregroundStyle(.black)
                            .padding(5)
                            .background(
                                Capsule()
                                    .foregroundStyle(.green)
                            )
                    }
                    Spacer()
                }
                
            }
        }
        .environment(quizManager)
    }
}

#Preview {
    TitleView()
}
