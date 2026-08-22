import Foundation

enum LoadState {
    case loading, ready, error
}

@Observable class ProductViewModel {

    private(set) var products: [Product] = []
    private let manager = APIManager()
    private(set) var state: LoadState = .loading

    func fetchProducts() async {
        state = .loading
        do {
            products = try await manager.request(url: "https://fakestoreapi.com/products")
            // Simulate network delay so the loading state is visible in the demo.
            try await Task.sleep(for: .seconds(3))
            state = .ready
        }catch {
            print("Fetch Product error:", error)
            state = .error
        }
    }
}
