//
//  ContentView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI
import CoreData

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Item>
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                VStack(spacing: 30) {
                    TextField("First name", text: $viewModel.firstNameTF)
                        .grayBackground()
                    TextField("Last name", text: $viewModel.lastNameTF)
                        .grayBackground()
                    TextField("Email", text: $viewModel.emailTF)
                        .grayBackground()
                    Button(action: { sigIn() }) {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .setBlueButtonStyle()
                    .fullScreenCover(isPresented: $viewModel.signInIsPresented) {
                        TabBarView()
                    }
                    .alert("Ошибка", isPresented: $viewModel.showAlert, actions: {}) {
                        Text("Такой польователь уже зарегистрирован")
                    }
                }
                .padding(EdgeInsets(top: 77, leading: 43, bottom: 0, trailing: 43))
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                    Button(action: { viewModel.loginIsPresented.toggle() }) {
                        Text("Log in")
                            .font(.footnote)
                            .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                    }
                    .fullScreenCover(isPresented: $viewModel.loginIsPresented) {
                        LogInView()
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 43, bottom: 0, trailing: 43))
                VStack(spacing: 50) {
                    Button(action: {}) {
                        Image("googleIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                        Text("Sign in with Google")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    Button(action: {}) {
                        Image("appleIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                        Text("Sign in with Apple")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
    private func sigIn() {
        if !viewModel.firstNameTF.isEmpty && !viewModel.lastNameTF.isEmpty && viewModel.emailTF.isValidEmail {
            for user in users {
                if user.firstName == viewModel.firstNameTF && user.lastName == viewModel.lastNameTF && user.email == viewModel.emailTF {
                    viewModel.showAlert.toggle()
                    return
                }
            }
            let newUser = Item(context: moc)
            newUser.id = UUID()
            newUser.firstName = viewModel.firstNameTF
            newUser.lastName = viewModel.lastNameTF
            newUser.email = viewModel.emailTF
            try? moc.save()
            viewModel.signInIsPresented.toggle()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
