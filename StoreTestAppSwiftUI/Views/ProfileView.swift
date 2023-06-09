//
//  ProfileView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 21.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    private let balance = "$ 1593"
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Profile")
                    .font(.title3)
                    .bold()
                if let image = viewModel.image {
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } else {
                    Image("photoExample")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }
                Button(action: {viewModel.showingImagePicker.toggle()}) {
                    Text("Change photo")
                        .font(.footnote)
                        .foregroundColor(Color(red: 0.5019607843137255, green: 0.5019607843137255, blue: 0.5019607843137255))
                }
                .sheet(isPresented: $viewModel.showingImagePicker) {
                    ImagePicker(image: $viewModel.inputImage)
                }
                Text("Full name User")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.24705882352941178, green: 0.24705882352941178, blue: 0.24705882352941178)/*@END_MENU_TOKEN@*/)
                Button(action: {}) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.trailing)
                        Text("Upload item")
                            .bold()
                        .foregroundColor(.white)
                    }
                }
                .setBlueButtonStyle()
                .padding()
                
                VStack(spacing: 20) {
                    ProfileButton(leftImage: "menubar.rectangle", rightImage: "chevron.right", text: "Trade store")
                    ProfileButton(leftImage: "creditcard", rightImage: "chevron.right", text: "Payment method")
                    HStack {
                        ProfileButton(leftImage: "creditcard", rightImage: "", text: "Balance")
                        Text(balance)
                    }
                    ProfileButton(leftImage: "creditcard", rightImage: "chevron.right", text: "Trade history")
                    ProfileButton(leftImage: "repeat", rightImage: "chevron.right", text: "Restore Purchase")
                    ProfileButton(leftImage: "questionmark.circle", rightImage: "", text: "Help")
                    Button(action: {viewModel.signInIspresented.toggle()}) {
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(.gray)
                                    .opacity(0.1)
                                Image(systemName: "iphone.and.arrow.forward")
                                    .foregroundColor(.black)
                            }
                            Text("Log out")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "")
                                .foregroundColor(.black)
                        }
                        .frame(height: 32)
                    }
                    .fullScreenCover(isPresented: $viewModel.signInIspresented) {
                        SignInView()
                    }
                    }
                .padding()
                Spacer()
            }
            .padding()
            .padding(.bottom, 40)
            .onChange(of: viewModel.inputImage) { _ in
                viewModel.loadImage()
            }
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
