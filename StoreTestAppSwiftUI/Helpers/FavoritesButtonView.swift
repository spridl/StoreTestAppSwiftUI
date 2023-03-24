//
//  FavoritesButtonView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 24.03.2023.
//

import SwiftUI

struct FavoritesButtonView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 229/255, green: 233/255, blue: 239/255))
                Image(systemName: "heart")
                    .resizable()
                    .foregroundColor(Color(red: 84/255, green: 85/255, blue: 137/255))
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                
            }
        }
    }
}

struct FavoritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesButtonView()
    }
}
