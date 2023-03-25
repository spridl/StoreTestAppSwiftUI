//
//  TabBarItems.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation

class TabBarItems {
    static let shared = TabBarItems()
    
    let tabBarItems = ["PageOne", "Favourites", "Cart", "Messages", "Profile"]
    
    private init () {}
}
