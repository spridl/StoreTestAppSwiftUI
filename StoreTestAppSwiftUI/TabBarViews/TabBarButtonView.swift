//
//  TabBarButtonView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import SwiftUI

struct TabBarButtonView: View {
    let buttonBgColor = Color(red: 238/255, green: 239/255, blue: 244/255)
    let unselectedButtonColor = Color(red: 144/255, green: 144/255, blue: 144/255)
    let selectedButtonColor = Color(red: 115/255, green: 114/255, blue: 151/255)
    @State var tab: String
    @Binding var selected: String
    var body: some View {
        ZStack {
            Button(action: {
                selected = tab
            }) {
                Image(tab)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(selected == tab ? selectedButtonColor : unselectedButtonColor)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .background(selected == tab ? buttonBgColor : .white)
        .clipShape(Circle())
    }
}

struct TabBarButtonView_Previews: PreviewProvider {
    @State static var select = "PageOne"
    static var previews: some View {
        TabBarButtonView(tab: "button", selected: $select)
    }
}
