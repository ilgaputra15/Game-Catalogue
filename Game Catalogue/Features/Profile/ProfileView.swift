//
//  ProfileView.swift
//  Game Catalogue
//
//  Created by ilga yulian putra on 02/08/20.
//  Copyright © 2020 ilga yulian putra. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var profile = ProfileState()
    @State var isEditing: Bool = false
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180.0, height: 180.0)
                    .clipped()
                    .cornerRadius(180)
                TextField("Your name", text: $profile.name)
                    .padding(16)
                    .multilineTextAlignment(.center)
                    .font(Font.system(size: 32, weight: .light, design: .default))
                    .modifier(EditingTextFieldMofier(isEditing: isEditing))
                    .foregroundColor(Color.white)
                    .padding(.top, 36.0)
                    .padding(.horizontal, 24.0)
                
                HStack {
                    Text("Email:")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    TextField("Email address", text: $profile.email)
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8.0)
                        .padding(.vertical, 12)
                        .modifier(EditingTextFieldMofier(isEditing: isEditing))
                }
                .padding(.top, 20.0)
                .padding(.horizontal, 32.0)
                HStack {
                    Text("Github:")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    TextField("Git hub link", text: $profile.githubLink)
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8.0)
                        .padding(.vertical, 12)
                        .modifier(EditingTextFieldMofier(isEditing: isEditing))
                }
                .padding(.horizontal, 32.0)
                Spacer()
            }
            .padding(.top, 48.0)
        }
        .navigationBarTitle("Profile Developer", displayMode: .inline)
        .navigationBarColor(UIColor.backgroundColor)
        .navigationBarHidden(false)
        .buttonStyle(PlainButtonStyle())
        .navigationBarItems(trailing:
            Button(action: {
                if self.isEditing {
                    self.profile.saveProfile()
                }
                self.isEditing = !self.isEditing
            }) {
                self.isEditing == true ? Text("Save") : Text("Edit")
            }
        )
            .onAppear {
                self.profile.getProfile()
        }
    }
}

struct EditingTextFieldMofier: ViewModifier {
    var isEditing: Bool
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing == true ? Color.white : Color.backgroundColor, lineWidth: 1))
            .disabled(!isEditing)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
