//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            HotelRegistrationScreen()
        }
    }
}

struct HotelRegistrationScreen: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var doorCode = ""
    @State var numberOfGuests = 1
    
    
    var body: some View {
        VStack {
            HStack {
                Image("mountainlandLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("Mountainland Inn")
                    .font(.custom("Verdana", size: 30))
                    .bold()
                    .foregroundStyle(Color.background)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.highlight)
                    }
            }
            
            Spacer()
            
            Text("Welcome!")
                .font(.custom("Rockwell", size: 20))
                .foregroundStyle(.text)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
                    .foregroundStyle(.highlight)
                    .padding()
                HStack {
                    Spacer(minLength: 24)
                    TextField("Last name field", text: $lastName, prompt: Text("Lastname"))
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                        }
                    TextField("First name field", text: $lastName, prompt: Text("Firstname"))
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                        }
                    Spacer(minLength: 24)
                }
            }
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
