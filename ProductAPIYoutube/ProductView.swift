//
//  ProductView.swift
//  ProductAPIYoutube
//
//  Created by Yogesh Patel on 13/11/23.
//

import SwiftUI

struct ProductView: View {

    let viewModel = ProductViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                   ProductRowView(product: product)
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
