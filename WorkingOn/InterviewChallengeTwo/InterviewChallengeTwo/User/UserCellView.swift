//
//  UserCellView.swift
//  InterviewChallengeTwo
//
//  Created by Logan Steven Bartell on 2/27/26.
//
import Foundation
import SwiftUI

struct UserCellView: View {
    @State var settings: Settings
    @State var viewModel: ViewModel
    let user: User
    var body: some View {
        VStack {
            
            userNameView()
            
            if settings.showUserTitle || settings.showUserFirstName || settings.showUserLastName {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 330, height: 5)
            }
            
            userInfoView()
            
        }
        .background(
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 350)
                .foregroundStyle(.gray)
        )
    }
    
    //View Builders
    
    func userNameView() -> some View {
        HStack {
            if settings.showUserImage {
                AsyncImage(url: URL(string: user.imageUrls.thumbnail))
                    .frame(width: 50, height: 50)
                    .offset(x: -30)
            }
            if settings.showUserTitle {
                Text(user.name.title)
                    .bold()
            }
            if settings.showUserFirstName {
                Text(user.name.firstName)
                    .bold()
            }
            if settings.showUserFirstName {
                Text(user.name.lastName)
                    .bold()
            }
        }
        .padding(6)
    }
    
    func userInfoView() -> some View {
        VStack {
            if settings.showUserEmail {
                Text(user.email)
                    .padding(4)
            }
            HStack {
                if settings.showUserGender {
                    Text("Gender: \(user.gender)")
                        .padding(.bottom)
                }
                if settings.showUserAge && settings.showUserGender {
                    Spacer()
                        .frame(width: 50)
                }
                if settings.showUserAge {
                    Text("Age: \(user.age)")
                        .padding(.bottom)
                }
            }
        }
    }
    
}


#Preview {
    UserCellView(settings: Settings(), viewModel: ViewModel(), user: User(name: UserName(firstName: "Bob", lastName: "Bilbly", title: "Mr"), imageUrls: UserPicture(large: "", medium: "", thumbnail: ""), gender: "Male", email: "BobBB@Gmail.com", dob: UserAge(age: 6)))
}
