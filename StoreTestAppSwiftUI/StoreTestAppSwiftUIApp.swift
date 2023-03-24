//
//  StoreTestAppSwiftUIApp.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 15.03.2023.
//

import SwiftUI

@main
struct StoreTestAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LatestGroupView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
