//
//  NetworkManager.swift
//  StoreTestAppSwiftUI
//
//  Created by Тимур on 23.03.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager: ObservableObject {
    @Published var latest = [Latest]()
    @Published var flashSale = [FlashSale]()
    
    init() {}
    
    func fetchLatestData() async {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Result.self, from: data)
            latest = result.latest
        } catch {
            print(NetworkError.decodingError)
        }
    }
    func fetchFlashSaleData() async {
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(FlashSaleResult.self, from: data)
            flashSale = result.flashSale
        } catch {
            print(NetworkError.decodingError)
        }
    }
}
