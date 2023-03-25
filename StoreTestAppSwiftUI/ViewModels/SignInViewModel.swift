//
//  SignInViewModel.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation

extension SignInView {
    @MainActor class SignInViewModel: ObservableObject {
        
        @Published var firstNameTF: String = ""
        @Published var lastNameTF: String = ""
        @Published var emailTF: String = ""
        
        @Published var signInIsPresented = false
        @Published var loginIsPresented = false
        
        @Published var showAlert = false
        
        
    }
}
