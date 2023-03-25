//
//  TabBarViewModel.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation

extension TabBarView {
    @MainActor class TabBarViewModel: ObservableObject {
        @Published var selectedTab = "PageOne"
        let tabBarItems = TabBarItems.shared.tabBarItems
    }
}
