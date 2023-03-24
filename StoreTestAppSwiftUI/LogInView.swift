//
//  LogInView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI

struct LogInView: View {
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Item>
    
    @State private var firstNameTF: String = ""
    @State private var passwordTF: String = ""
    @State private var loginIsPresented = false
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.title)
            .bold()
            VStack(spacing: 30) {
                TextField("First name", text: $firstNameTF)
                    .grayBackground()
                SecureInputView("Password", text: $passwordTF)
            }
            .padding(EdgeInsets(top: 77, leading: 0, bottom: 100, trailing: 0))
            
            Button(action: {login()}) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .setBlueButtonStyle()
            .sheet(isPresented: $loginIsPresented) {
                PageOneView()
            }
        }
        .padding(EdgeInsets(top: 0, leading: 43, bottom: 200, trailing: 43))
    }
    
    private func login() {
        for user in users {
            if user.firstName == firstNameTF {
                loginIsPresented.toggle()
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
