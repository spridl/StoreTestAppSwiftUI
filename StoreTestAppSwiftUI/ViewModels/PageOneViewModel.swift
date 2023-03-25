//
//  PageOneViewModel.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation

extension PageOneView {
    @MainActor class PageOneViewModel: ObservableObject {
        @Published var groupLatestName = "Latest"
        @Published var groupFlashSaleName = "Flash sale"
        @Published var groupBrandsName = "Brands"
    }
}
