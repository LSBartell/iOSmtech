//
//  ContentView.swift
//  button
//
//  Created by Logan Steven Bartell on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Next")
            }
            .buttonStyle(GradiantButton())
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(LinearGradient(colors: [.green, .gray], startPoint: .leading, endPoint: .trailing))
            )
            HStack {
                Button(action: dogJumpToRight) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.green)
                        if hasJumped == false {
                            Text("🐕")
                                .font(.largeTitle)
                        }
                    }
                    .padding()
                }
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Gradient(colors: [.white, .blue]))
                }
                Button(action: dogJumpToLeft) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.green)
                        if hasJumped == true {
                            Text("🐕")
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()
            }
            Button(action: toggleSafety) {
                Text("Do not push")
                    .font(.title)
                    .foregroundStyle(.black)
                    .frame(width: 110, height: 110)
            }
            .background(
                Circle()
                    .foregroundStyle(Color.red)
            )
            Button(action: explode) {
                Text("Ka-Boom!")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding()
                    .background(
                        Rectangle()
                            .foregroundStyle(Gradient(colors: [.yellow, .orange]))
                    )
                    .disabled(doubleSafety)
                    .opacity(doubleSafety ? 0.0 : 1)
                    .scaleEffect(boom ? 5 : 1)
            }
            HStack {
                Button(action: pressButton1) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: .infinity, height: 25)
                        .foregroundStyle(button1 ? .cyan : .blue)
                }
                .offset(y: button1 ? 30 : 0)
                
                Button(action: pressButton2) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: .infinity, height: 25)
                        .foregroundStyle(button2 ? .cyan : .blue)
                }
                .offset(y: button2 ? 30 : 0)
                Button(action: pressButton3) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: .infinity, height: 25)
                        .foregroundStyle(button3 ? .cyan : .blue)
                }
                .offset(y: button3 ? 30 : 0)
            }
            Spacer()
            Button(action: toggleDoubleSafety) {
                Text("Really dont push!")
                    .font(.title)
                    .foregroundStyle(.yellow)
                    .frame(width: .infinity)
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.red)
            )
            .disabled(safety)
            .opacity(safety ? 0.5 : 1)
        }
    }
    func dogJumpToRight() {
        hasJumped = true
    }
    func dogJumpToLeft() {
        hasJumped = false
    }
    @State var hasJumped = false
    @State var safety = true
    
    func toggleSafety() {
        if safety == false {
            safety = true
        } else {
            safety = false
        }
    }
    
    @State var doubleSafety = true
    
    func toggleDoubleSafety() {
        if doubleSafety {
            doubleSafety = false
        } else {
            doubleSafety = true
        }
    }
    
    @State var boom = false
    
    func explode() {
        if boom == false {
            boom = true
        } else {
            boom = false
        }
    }
    
    @State var button1 = false
    @State var button2 = false
    @State var button3 = false
    
    func pressButton1() {
        if button1 {
            button1 = false
        } else {
            button1 = true
            button2 = false
            button3 = false
        }
    }
    func pressButton2() {
        if button2 {
            button2 = false
        } else {
            button1 = false
            button2 = true
            button3 = false
        }
    }
    func pressButton3() {
        if button3 {
            button3 = false
        } else {
            button1 = false
            button2 = false
            button3 = true
        }
    }
}
#Preview {
    ContentView()
}
