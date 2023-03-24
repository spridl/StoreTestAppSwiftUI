//
//  SecureInputView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 19.03.2023.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    private let backgroundColorTF = Color(red: 232/255, green: 232/255, blue: 232/255)
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }
            .frame(height: 30)
            .background(backgroundColorTF)
            .cornerRadius(30)
            .multilineTextAlignment(.center)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
            .padding()
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    @State static var text = "password"
    static var previews: some View {
        SecureInputView("password", text: $text)
    }
}
