//
//  GroupNameView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 22.03.2023.
//

import SwiftUI

struct GroupNameView: View {
    @Binding var groupName: String
    var body: some View {
        HStack {
            Text(groupName)
                .bold()
            Spacer()
            Button(action: {}) {
                Text("View all")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct GroupNameView_Previews: PreviewProvider {
    @State static var groupName = "Latest"
    static var previews: some View {
        GroupNameView(groupName: $groupName)
    }
}
