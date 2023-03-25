//
//  PageOneView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 17.03.2023.
//

import SwiftUI

struct PageOneView: View {
    @StateObject private var viewModel = PageOneViewModel()
    let rows = [
        GridItem(.flexible())
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack(spacing: 20) {
                        SearchBarView()
                            .padding(EdgeInsets(top: 20, leading: 56, bottom: 0, trailing: 56))
                        CategoriesView()
                        GroupNameView(groupName: $viewModel.groupLatestName)
                        LatestGroupView()
                            .frame(height: geometry.size.height / 4)
                            .padding(.bottom)
                        GroupNameView(groupName: $viewModel.groupFlashSaleName)
                        FlashSaleView()
                            .frame(height: geometry.size.height * 0.35)
                        GroupNameView(groupName: $viewModel.groupBrandsName)
                        Spacer()
                    }
                    .navigationTitle(Text("Trade by bata"))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {}) {
                                Image(systemName: "text.justify")
                                    .bold()
                                    .foregroundColor(.black)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack {
                                Image("photoExample")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 40, height: 40)
                                Button(action: {}) {
                                    HStack {
                                        Text("Location")
                                            .font(.footnote)
                                        .foregroundColor(.gray)
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                }
                }
            }
        }
    }
}

struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView()
    }
}
