import SwiftUI

struct ProductView: View {

    private let viewModel = ProductViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .loading:
                    loadingView
                case .ready:
                    productView
                case .error:
                    EmptyView()
                }
            }
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
    
    private var productView: some View {
        List {
            ForEach(Array(viewModel.products.enumerated()), id: \.element.id) { index, product in
                NavigationLink {
                    ProductDetailsView(products: viewModel.products, index: index)
                } label: {
                    ProductRowView(product: product)
                }
            }
        }
        .listStyle(.plain)
    }
    
    private var loadingView: some View {
        List {
            ForEach(1 ... 5, id: \.self) { _ in
                ProductRowView(product: .placeholder)
            }
        }
        .redacted(reason: .placeholder)
    }
}

#Preview {
    ProductView()
}
