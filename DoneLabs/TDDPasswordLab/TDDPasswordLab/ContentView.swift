//
//  ContentView.swift
//  TDDPasswordLab
//
//  Created by Logan Steven Bartell on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack {
            
            Text("Enter New Password")
                .font(.title)
                .underline()
            
            Spacer()
            
            TextField("Password", text: $viewModel.password)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.gray)
                )
                .onChange(of: viewModel.password) {
                    viewModel.updatePasswordStatus(password: viewModel.password)
                }
            
            HStack {
                checkOrXView(bool: viewModel.passwordOverMin)
                Text("Password over 7 characters")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordUnderMax)
                Text("Password under 30 characters")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordHasNumber)
                Text("Password has number")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordHasSpecial)
                Text("Password has special character")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordNoPatterns)
                Text("Password has no patterns")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordHasUpper)
                Text("Password has Uppercase")
                Spacer()
            }
            .padding(5)
            
            HStack {
                checkOrXView(bool: viewModel.passwordHasLower)
                Text("Password has lowercase")
                Spacer()
            }
            .padding(5)
            
            if viewModel.passwordIsGood {
                Button("Save") {
                    
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

func checkOrXView(bool: Bool) -> some View {
    if bool {
        Image(systemName: "checkmark.circle.fill")
            .foregroundStyle(.green)
    } else {
        Image(systemName: "x.circle.fill")
            .foregroundStyle(.red)
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
