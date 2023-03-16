//
//  ContentView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI
import CoreData

struct SignInView: View {
    @State private var firstNameTF: String = ""
    @State private var lastNameTF: String = ""
    @State private var emailTF: String = ""
    
    private let backgroundColorTF = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
            VStack(spacing: 30) {
                TextField("First name", text: $firstNameTF)
                    .frame(height: 30)
                    .background(backgroundColorTF)
                    .cornerRadius(30)
                .multilineTextAlignment(.center)
                TextField("Last name", text: $firstNameTF)
                    .frame(height: 30)
                    .background(backgroundColorTF)
                    .cornerRadius(30)
                .multilineTextAlignment(.center)
                TextField("Email", text: $firstNameTF)
                    .frame(height: 30)
                    .background(backgroundColorTF)
                    .cornerRadius(30)
                .multilineTextAlignment(.center)
                Button(action: {}) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(height: 46)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                .cornerRadius(15)
            }
            .padding(EdgeInsets(top: 77, leading: 43, bottom: 0, trailing: 43))
            HStack {
                Text("Already have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                Button(action: {}) {
                    Text("Log in")
                        .font(.footnote)
                        .foregroundColor(Color(red: 37/255, green: 79/255, blue: 230/255))
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 43, bottom: 0, trailing: 43))
            VStack(spacing: 50) {
                Button(action: {}) {
                    Image("googleIcon")
                    Text("Sign in with Google")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Button(action: {}) {
                    Image("appleIcon")
                    Text("Sign in with Apple")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
