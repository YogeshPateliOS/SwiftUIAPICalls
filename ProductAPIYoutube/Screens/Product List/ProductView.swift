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
                    errorView
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
    
    private var errorView: some View {
        ContentUnavailableView {
            Label("Unable to load products", systemImage: "exclamationmark.triangle")
        } description: {
            Text("We couldn't load the products right now. Please try again.")
        } actions: {
            Button("Try Again") {
                Task {
                    await viewModel.fetchProducts()
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ProductView()
}
