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
    @State var numberOfGuests = "1"
    @State var submitted = false
    func submitButton() {
        if submitted {
            submitted = false
        } else {
            submitted = true
        }
    }
    
    @State var lengthOfStay = "1 Night"
    @State var ratingInput = 1.0
    let guestNumberChoices = ["1", "2", "3", "4", "5"]
    let guestStayChoices = ["1 Night", "2 Nights", "3 Nights", "4 Nights", "5 Nights", "6 Nights", "Week"]
    
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
            
            Spacer(minLength: 30)
            
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
                    TextField("First name field", text: $firstName, prompt: Text("Firstname"))
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                        }
                    Spacer(minLength: 24)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.highlight)
                    .padding()
                
                VStack() {
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack(alignment: .center) {
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Text("Number Of Guests:")
                            .font(.custom("Rockwell", size: 15))
                            .foregroundStyle(Color.highlight)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.background)
                            )
                        
                        Spacer()
                        
                        Picker("Number Of Guests", selection: $numberOfGuests) {
                            ForEach(guestNumberChoices, id: \.self) { number in
                                Text(number)
                            }
                        }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.background)
                            )
                        
                        Spacer()
                            .frame(width: 25)
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .modifier(seperatorModifier())
                    
                        Text("Pick Door Password")
                            .font(.custom("Rockwell", size: 15))
                            .foregroundStyle(Color.highlight)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.background)
                            )
                    HStack {
                        Spacer(minLength: 30)
                        SecureField("Password", text: $doorCode, prompt: Text("Password"))
                            .padding(5)
                            .background()
                        Spacer(minLength: 30)
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .modifier(seperatorModifier())
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Text("Length Of Stay:")
                            .font(.custom("Rockwell", size: 15))
                            .foregroundStyle(Color.highlight)
                            .padding(7)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.background)
                                )
                        
                        Spacer()
                        
                        Picker("Length Of Stay", selection: $lengthOfStay) {
                            ForEach(guestStayChoices, id: \.self) { choice in
                                Text(choice)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.background)
                        )
                        
                        Spacer()
                            .frame(width: 25)
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .modifier(seperatorModifier())
                    
                    ZStack {
                        Button(action: submitButton) {
                            Text("Submit")
                        }
                            .font(.custom("Veranda", size: 25))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .background(
                                Capsule()
                                    .foregroundStyle(.white)
                            )
                        if submitted == true {
                            Button(action: submitButton) {
                                Text("Submitted!")
                            }
                                .font(.custom("Veranda", size: 25))
                                .bold()
                                .foregroundStyle(.white)
                                .padding()
                                .background(
                                    Capsule()
                                        .foregroundStyle(.green)
                                    )
                        }
                    }
                    
                    if submitted == true {
                        Slider(value: $ratingInput, in: 1...5, step: 1)
                            .frame(width: 300)
 
                            Text("\(Int(ratingInput))/5⭐️s")
                                .padding()
                                .background()
                        
                    }
                    
                    Spacer()
                }
            }
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
