//
//  ProductViewModel.swift
//  ProductAPIYoutube
//
//  Created by Yogesh Patel on 13/11/23.
//

import Foundation

@Observable class ProductViewModel {

    var products: [Product] = []
    private let manager = APIManager()

    func fetchProducts() async {
        do {
            products = try await manager.request(url: "https://fakestoreapi.com/products")
            print(products)
        }catch {
            print("Fetch Product error:", error)
        }
    }
}
