//
//  TabBarView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 24.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                PageOneView()
                    .tag("PageOne")
                Text("Favourites")
                    .tag("Favourites")
                Text("Cart")
                    .tag("Cart")
                Text("Messages")
                    .tag("Messages")
                ProfileView()
                    .tag("Profile")
            }
            HStack {
                ForEach(viewModel.tabBarItems, id: \.self) { tab in
                    Spacer()
                    TabBarButtonView(tab: tab, selected: $viewModel.selectedTab)
                    Spacer()
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.white))
            .clipShape(Capsule())
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
