//
//  ContentView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI
import CoreData

struct SignInView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Item>
    
    @State private var firstNameTF: String = ""
    @State private var lastNameTF: String = ""
    @State private var emailTF: String = ""
    
    @State private var signInIsPresented = false
    @State private var loginIsPresented = false
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
            VStack(spacing: 30) {
                TextField("First name", text: $firstNameTF)
                    .grayBackground()
                TextField("Last name", text: $lastNameTF)
                    .grayBackground()
                TextField("Email", text: $emailTF)
                    .grayBackground()
                Button(action: { sigIn() }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .setBlueButtonStyle()
                .sheet(isPresented: $signInIsPresented) {
                    PageOneView()
                }
            }
            .padding(EdgeInsets(top: 77, leading: 43, bottom: 0, trailing: 43))
            HStack {
                Text("Already have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                Button(action: { loginIsPresented.toggle() }) {
                    Text("Log in")
                        .font(.footnote)
                        .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                }
                .fullScreenCover(isPresented: $loginIsPresented) {
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
    private func sigIn() {
        if !firstNameTF.isEmpty && !lastNameTF.isEmpty && emailTF.isValidEmail {
            for user in users {
                if user.firstName == firstNameTF && user.lastName == lastNameTF && user.email == emailTF {
                    return
                }
            }
            let newUser = Item(context: moc)
            newUser.id = UUID()
            newUser.firstName = firstNameTF
            newUser.lastName = lastNameTF
            newUser.email = emailTF
            try? moc.save()
            signInIsPresented.toggle()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
