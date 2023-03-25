//
//  LogInView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI

struct LogInView: View {
    @StateObject private var viewModel = LoginViewModel()
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Item>
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Welcome back")
                    .font(.title)
                .bold()
                VStack(spacing: 30) {
                    TextField("First name", text: $viewModel.firstNameTF)
                        .grayBackground()
                    SecureInputView("Password", text: $viewModel.passwordTF)
                }
                .padding(EdgeInsets(top: 77, leading: 0, bottom: 100, trailing: 0))
                
                Button(action: {login()}) {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .setBlueButtonStyle()
                .fullScreenCover(isPresented: $viewModel.loginIsPresented) {
                    TabBarView()
                }
                .alert("Ошибка", isPresented: $viewModel.alertIsPresented, actions: {}) {
                    Text("Такого пользователя не существует")
                }

            }
            .padding(EdgeInsets(top: 0, leading: 43, bottom: 200, trailing: 43))
        }
    }
    
    private func login() {
        if users.contains(where: { $0.firstName == viewModel.firstNameTF }) {
            viewModel.loginIsPresented.toggle()
        } else {
            viewModel.alertIsPresented.toggle()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
