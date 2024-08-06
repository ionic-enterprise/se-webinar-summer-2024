import Foundation
import UIKit

class GalleryViewModel: ObservableObject {
    
    var carouselProducts: [Product] = []
    var listProducts: [Product] = []
    var imageLoader: ImageLoaderProtocol?
    @Published var selectedProduct: Product?
    private var dataStore: DataStoreViewModel
    var contents: [Product] {
        dataStore.products
    }
    private enum Sections: Int, CaseIterable {
        case carousel, list
    }
    init(dataStore: DataStoreViewModel) {
        self.dataStore = dataStore
        for product in self.dataStore.products {
            if(product.category.rawValue == "MustHaves"){
                carouselProducts.append(product)
            }
            listProducts.append(product)
        }
    }
    func selectProduct(by id: Int?) {
        guard let id = id else {
            selectedProduct = nil
            return
        }
        if let product = dataStore.product(for: id) {
            selectedProduct = product
        }
    }
    func image(named name: String) -> UIImage {
        dataStore.imageLoader.imageFor(name)
    }
    
}
