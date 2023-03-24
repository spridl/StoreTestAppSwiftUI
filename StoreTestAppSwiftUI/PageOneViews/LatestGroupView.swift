//
//  LatestGroupView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 22.03.2023.
//

import SwiftUI

struct LatestGroupView: View {
    @ObservedObject var networkManager = NetworkManager()
    private let rows = [
        GridItem(.flexible())
                 ]
var body: some View {
    GeometryReader { geometry in
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: geometry.size.width))], spacing: 20) {
                    ForEach(networkManager.latest, id: \.self) { item in
                        ZStack {
                            AsyncImage(url: URL(string: item.imageUrl)){ image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                                    .cornerRadius(30)
                            } placeholder: {
                                Image(systemName: "xmark.shield")
                                    .resizable()
                        }
                            VStack {
                                Spacer()
                                HStack {
                                        Text(item.category)
                                        .bold()
                                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                                            .background(Color(red: 196/255, green: 196/255, blue: 196/255))
                                            .cornerRadius(10)
                                            .opacity(0.8)
                                        .padding(.leading)
                                    Spacer()
                                }
                                HStack {
                                    Text(item.name)
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.bottom)
                                HStack {
                                    Text("$ \(item.price)")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.leading)
                                    Spacer()
                                    Button(action: {}) {
                                        AddToCartButton()
                                            .frame(
                                                width: geometry.size.width * 0.1,
                                                height: geometry.size.width * 0.1
                                            )
                                    }
                                    .padding()
                                }
                            }
                    }
//                        .frame(width: geometry.size.height / 3)
                }
//                    .frame(width: geometry.size.height / 3)
            }

                }
            .task {
                await networkManager.fetchLatestData()
        }
    }
}
}



struct LatestGroupView_Previews: PreviewProvider {
    static var previews: some View {
        LatestGroupView()
    }
}
