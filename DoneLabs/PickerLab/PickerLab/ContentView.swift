//
//  ContentView.swift
//  PickerLab
//
//  Created by Logan Steven Bartell on 1/9/26.
//
import Foundation
import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var newDescription = ""
    @State var newColor: Color = .white
    @State var newDate: Date = .now
    @State var newCardThemePhoto: PhotosPickerItem? = nil
    @State var selectedImage: Image? = nil
    @State var savedBirthdayCard: BirthdayCard? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Birthday card maker")
                    .underline()
                    .bold()
                    .font(.largeTitle)
                
                Spacer()
                
                List {
                    Section("Description") {
                        TextField("Description", text: $newDescription)
                    }
                    Section("Card Color") {
                        ColorPicker("Pick a Color", selection: $newColor)
                    }
                    Section("Party Date") {
                        DatePicker("Select date & time", selection: $newDate, displayedComponents: [.date, .hourAndMinute])
                    }
                    Section("Card theme") {
                        PhotosPicker("Theme Photo", selection: $newCardThemePhoto, matching: .images)
                        if let image = selectedImage {
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                    .onChange(of: newCardThemePhoto) { oldValue, newValue in
                        photoChange(newValue)
                    }
                }
                
                HStack {
                    if selectedImage != nil {
                        Button {
                            saveCard()
                        } label: {
                            Text("Save")
                                .padding()
                                .foregroundStyle(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                )
                        }
                        if savedBirthdayCard != nil {
                            NavigationLink {
                                BirthdayCardView(birthdayCard: savedBirthdayCard!)
                            } label: {
                                Text("Next")
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                    )
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
    func photoChange(_ newValue: PhotosPickerItem?) {
        Task {
            if let newValue {
                if let data = try? await newValue.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = Image(uiImage: uiImage)
                }
            } else {
                selectedImage = nil
            }
        }
    }
    
    func saveCard() {
        savedBirthdayCard = BirthdayCard(description: newDescription, date: newDate, backgroundColor: newColor, Photo: selectedImage!)
    }
}


#Preview {
    ContentView()
}
