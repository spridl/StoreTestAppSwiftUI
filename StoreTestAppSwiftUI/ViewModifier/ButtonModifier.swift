//
//  ButtonModifier.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 16.03.2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 46)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
            .cornerRadius(15)
    }
}

extension Button {
    func setBlueButtonStyle() -> some View {
        ModifiedContent(content: self, modifier: ButtonModifier())
    }
}
