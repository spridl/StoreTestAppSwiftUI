//
//  ProfileViewModel.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 25.03.2023.
//

import Foundation
import SwiftUI

extension ProfileView {
    @MainActor class ProfileViewModel: ObservableObject {
        @Published var signInIspresented = false
        @Published var image: Image?
        @Published var showingImagePicker = false
        @Published var inputImage: UIImage?
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            image = Image(uiImage: inputImage)
        }
    }
}
