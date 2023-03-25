//
//  ProfileView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 21.03.2023.
//

import SwiftUI

struct ProfileView: View {
    private let balance = "$ 1593"
    var body: some View {
        ScrollView {
            VStack {
                Text("Profile")
                    .font(.title3)
                    .bold()
                Image("photoExample")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Button(action: {}) {
                    Text("Change photo")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.5019607843137255, blue: 0.5019607843137255))
                }
                Text("Full name User")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.24705882352941178, green: 0.24705882352941178, blue: 0.24705882352941178)/*@END_MENU_TOKEN@*/)
                Button(action: {}) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.trailing)
                        Text("Upload item")
                            .bold()
                        .foregroundColor(.white)
                    }
                }
                .setBlueButtonStyle()
                .padding()
                
                VStack(spacing: 20) {
                    ProfileButton(leftImage: "menubar.rectangle", rightImage: "chevron.right", text: "Trade store")
                    ProfileButton(leftImage: "creditcard", rightImage: "chevron.right", text: "Payment method")
                    HStack {
                        ProfileButton(leftImage: "creditcard", rightImage: "", text: "Balance")
                        Text(balance)
                    }
                    ProfileButton(leftImage: "creditcard", rightImage: "chevron.right", text: "Trade history")
                    ProfileButton(leftImage: "repeat", rightImage: "chevron.right", text: "Restore Purchase")
                    ProfileButton(leftImage: "questionmark.circle", rightImage: "", text: "Help")
                    ProfileButton(leftImage: "iphone.and.arrow.forward", rightImage: "", text: "Log out")
                }
                .padding()
                Spacer()
            }
            .padding()
            .padding(.bottom, 40)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
