//
//  LogInView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI

struct LogInView: View {
    @State private var firstNameTF: String = ""
    @State private var passwordTF: String = ""
    
    private let backgroundColorTF = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.title)
            .bold()
            VStack(spacing: 30) {
                TextField("First name", text: $firstNameTF)
                    .frame(height: 30)
                    .background(backgroundColorTF)
                    .cornerRadius(30)
                .multilineTextAlignment(.center)
                TextField("Password", text: $passwordTF)
                    .frame(height: 30)
                    .background(backgroundColorTF)
                    .cornerRadius(30)
                .multilineTextAlignment(.center)
            }
            .padding(EdgeInsets(top: 77, leading: 0, bottom: 100, trailing: 0))
            
            Button(action: {}) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(height: 46)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
            .cornerRadius(15)
        }
        .padding(EdgeInsets(top: 0, leading: 43, bottom: 200, trailing: 43))
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
