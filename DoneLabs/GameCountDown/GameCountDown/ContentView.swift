//
//  ContentView.swift
//  GameCountDown
//
//  Created by Logan Steven Bartell on 12/8/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State var lightChange: LightChange = .noLights
    @State var numberCountDown: NumberCountDown = .noNumber
    
    enum LightChange {
        case noLights, red1, red1ToRed2, red2ToYellow, yellowToGreen
    }
    enum NumberCountDown {
        case noNumber, threeIn, twoIn, oneIn, goIn
    }
    
    
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    switch lightChange {
                    case .noLights:
                        Spacer()
                    case .red1:
                        Circle()
                            .frame(width: 100)
                            .foregroundStyle(.red)
                            .matchedGeometryEffect(id: "red1ToRed2", in: animation)
                        Spacer()
                            .frame(width: 200)
                    case .red1ToRed2:
                        Spacer()
                            .frame(width: 100)
                        Circle()
                            .frame(width: 100)
                            .foregroundStyle(.red)
                            .matchedGeometryEffect(id: "red1ToRed2", in: animation), in: animation)
                        Spacer()
                            .frame(width: 100)
                    case .red2ToYellow:
                        Spacer()
                            .frame(width: 200)
                        Circle()
                            .frame(width: 100)
                            .foregroundStyle(.yellow)
                            .matchedGeometryEffect(id: "red1ToRed2", in: animation)
                    case .yellowToGreen:
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundStyle(.green)
                            .frame(width: 200, height: 100)
                            .overlay() {
                                Text("GO!!!")
                            }
                            .matchedGeometryEffect(id: "red1ToRed2", in: animation)
                    }
                
                }
                Spacer()
                startButton()
            }
            switch numberCountDown {
            case .noNumber:
                Spacer()
                    .frame(height: 150)
            case .threeIn:
                Text("3")
                    .font(.custom("Arial", size: 150))
                    .transition(
                        .asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity)
                    )
            case .twoIn:
                Text("2")
                    .font(.custom("Arial", size: 150))
                    .transition(
                        .asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity)
                    )
            case .oneIn:
                Text("1")
                    .font(.custom("Arial", size: 150))
                    .transition(
                        .asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity)
                    )
            case .goIn:
                Text("GO!")
                    .font(.custom("Arial", size: 150))
                    .transition(
                        .asymmetric(insertion: .scale.combined(with: .opacity), removal: .opacity)
                    )
            }
        }
    }
    
    //ViewBulders
    private func startButton() -> some View {
        Button("Start Game") {
            withAnimation {
                lightChange = .red1
            }
            withAnimation(.easeIn(duration: 0.8)) {
                numberCountDown = .threeIn
            } completion: {
                withAnimation(.easeIn(duration: 0.5)) {
                    lightChange = .red1ToRed2
                }
                withAnimation(.easeIn(duration: 0.8)) {
                    numberCountDown = .twoIn
                } completion: {
                    withAnimation(.easeIn(duration: 0.5)) {
                        lightChange = .red2ToYellow
                    }
                    withAnimation(.easeIn(duration: 0.8)) {
                        numberCountDown = .oneIn
                    } completion: {
                        withAnimation(.easeIn(duration: 0.5)) {
                            lightChange = .yellowToGreen
                        }
                        withAnimation(.easeIn(duration: 0.5)) {
                            numberCountDown = .goIn
                        }
                    }
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
