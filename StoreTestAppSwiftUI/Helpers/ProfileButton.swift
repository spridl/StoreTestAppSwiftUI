//
//  ProfileButton.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 21.03.2023.
//

import SwiftUI

struct ProfileButton: View {
    @State var leftImage: String = "creditcard"
    @State var rightImage = "chevron.right"
    @State var text = "Trade store"
    var body: some View {
        Button(action: {}) {
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.1)
                    Image(systemName: leftImage)
                        .foregroundColor(.black)
                }
                Text(text)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: rightImage)
                    .foregroundColor(.black)
            }
            .frame(height: 32)
                
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton()
    }
}
