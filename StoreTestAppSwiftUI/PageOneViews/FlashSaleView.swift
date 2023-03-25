//
//  FlashSaleView.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 23.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: geometry.size.width), spacing: 20)]) {
                    ForEach(networkManager.flashSale, id: \.self) { item in
                        ZStack {
                            AsyncImage(url: URL(string: item.imageUrl)){ image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width / 2, height: geometry.size.height)
                                    .cornerRadius(30)
                            } placeholder: {
                                Image(systemName: "xmark.shield")
                                    .resizable()
                        }
                            VStack {
                                HStack {
                                    Spacer()
                                    Text("\(item.discount)% off")
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                                        .background(Color(.red))
                                        .clipShape(Capsule())
                                        .padding(.trailing)
                                        .padding(.top)
                                        .bold()
                                    
                                        
                                }
                                Spacer()
                                VStack {
                                    HStack {
                                        Text(item.category)
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                            .background(Color(.gray))
                                            .clipShape(Capsule())
                                            .padding(.top)
                                            .bold()
                                            .opacity(0.7)
                                        
                                        Spacer()
                                    }
                                    HStack {
                                        Text(item.name)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .frame(width: 140)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("$ \(String(format: "%0.2f",item.price))")
                                            .foregroundColor(.white)
                                            .padding(.bottom)
                                        Spacer()
                                        Button(action: {}) {
                                            FavoritesButtonView()
                                                .frame(
                                                    width: geometry.size.width * 0.08,
                                                    height: geometry.size.width * 0.08
                                                )
                                        }
                                        .padding(.bottom)
                                        Button(action: {}) {
                                            AddToCartButton()
                                                .frame(
                                                    width: geometry.size.width * 0.1,
                                                    height: geometry.size.width * 0.1
                                                )
                                        }
                                        .padding(.bottom)
                                        .padding(.trailing)
                                        
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
            }
            .task {
                await networkManager.fetchFlashSaleData()
            }
        }
        
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView()
    }
}
