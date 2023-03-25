//
//  SearchBarView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 22.03.2023.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText = ""
    var body: some View {
        HStack {
            
            TextField("What are yoy looking for?", text: $searchText)
                .padding(.leading)
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing)
        }
        .font(.footnote)
        .background(Color(red: 0.9607843137254902, green: 0.9647058823529412, blue: 0.9686274509803922))
        .cornerRadius(20)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
