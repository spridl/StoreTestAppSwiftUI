//
//  LoginViewModel.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation

extension LogInView {
    @MainActor class LoginViewModel: ObservableObject {
        @Published var firstNameTF: String = ""
        @Published var passwordTF: String = ""
        @Published var loginIsPresented = false
        @Published var alertIsPresented = false
    }
}
