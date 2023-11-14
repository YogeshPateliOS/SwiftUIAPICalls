//
//  Product.swift
//  ProductAPIYoutube
//
//  Created by Yogesh Patel on 13/11/23.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title, description, category, image: String
    let price: Double
    let rating: Rate

    static var dummy: Product {
        return Product(id: 1,
                       title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                       description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                       category: "men's clothing",
                       image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                       price: 109.95,
                       rating: Rate(rate: 3.9,
                                    count: 120))
    }
}

struct Rate: Decodable {
    let rate: Double
    let count: Int
}
