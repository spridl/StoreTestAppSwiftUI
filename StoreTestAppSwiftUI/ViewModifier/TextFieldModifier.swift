//
//  TextFieldModifier.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 16.03.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    private let backgroundColorTF = Color(red: 232/255, green: 232/255, blue: 232/255)
    let vm = ""
    
    func body(content: Content) -> some View {
        content
            .frame(height: 32)
            .background(backgroundColorTF)
            .cornerRadius(30)
            .multilineTextAlignment(.center)
    }
}

extension TextField {
    func grayBackground() -> some View {
        ModifiedContent(content: self, modifier: TextFieldModifier())
    }
}
