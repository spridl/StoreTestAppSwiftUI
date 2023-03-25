//
//  CategoriesView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 21.03.2023.
//

import SwiftUI

struct CategoriesView: View {
    let shared = Categories.shared
    let rows = [
        GridItem(.fixed(60))
    ]
    var body: some View {
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(shared.categoryName, id: \.self) { item in
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image("\(item)")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 20)
                        }
                        Text(item)
                            .font(.custom("footnote", size: 10))
                            .foregroundColor(.gray)
                    }
                    
                }
            }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
