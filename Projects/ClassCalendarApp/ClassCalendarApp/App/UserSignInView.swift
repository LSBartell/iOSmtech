//
//  UserSignInView.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 1/28/26.
//

import SwiftUI

struct UserSignInView: View {
    @State var viewModel: UserSignInViewModel
    
    var body: some View {
        if viewModel.user == nil {

                ZStack {
                    
                    Color.background
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack(alignment: .top) {
                            Image("MtechLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .background {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundStyle(.white)
                                }
                                .scenePadding(.leading)
                            
                            Text("iOS Calendar")
                                .font(
                                    .custom("Verdana", size: 30)
                                    .bold()
                                )
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .scenePadding(.horizontal)
                                .foregroundStyle(.white)
                            VStack {
                                Text("User Sign In")
                                    .font(.title)
                                    .underline()
                                    .padding()
                                
                                HStack {
                                    Text("Email:")
                                        .underline()
                                        .padding(.leading, 25)
                                    
                                    Spacer()
                                }
                                
                                TextField("email", text: $viewModel.email)
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.forground)
                                    )
                                    .padding(.leading, 30)
                                    .padding(.trailing, 30)
                                    .onChange(of: viewModel.email) {
                                        viewModel.resetAttempt()
                                    }
                                
                                HStack {
                                    Text("Password:")
                                        .underline()
                                        .padding(.leading, 25)
                                    
                                    Spacer()
                                }
                                
                                TextField("password", text: $viewModel.password)
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.forground)
                                    )
                                    .padding(.leading, 30)
                                    .padding(.trailing, 30)
                                    .onChange(of: viewModel.password) {
                                        viewModel.resetAttempt()
                                    }
                                
                                
                                Button {
                                    viewModel.attemptSignIn()
                                } label: {
                                    Text("Sign In")
                                }
                                .padding()
                                
                                if viewModel.loading {
                                    ProgressView("Loading")
                                }
                                Spacer()
                            }
                            
                        }
                    }
                }
                
            
        } else {
            ParentTabView(user: viewModel.user!)
        }
            
        }
    }


#Preview {
    UserSignInView(viewModel: UserSignInViewModel())
}
