import SwiftUI

struct ShopView: View {
    @ObservedObject private var viewModel: GalleryViewModel = .default
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    FeaturedProductView()
                    Text("Products")
                        .font(.title2)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 178))]) {
                        ForEach(viewModel.listProducts) { product in
                            NavigationLink(destination: ItemDetailView(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)))) {
                                GalleryViewItem(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)), horizontal: false)
                            }
                        }
                    }
                }
                .padding(.leading, 16)
            }.navigationTitle("Shop")
                .navigationDestination(item: $viewModel.selectedProduct ) { product in
                    ItemDetailView(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)))
                }
        }
    }

}

#Preview {
    ShopView()
}
