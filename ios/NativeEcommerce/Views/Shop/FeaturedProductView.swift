//
//  FeaturedProductView.swift
//  NativeEcommerce
//
//  Created by Bryan Evans on 7/30/24.
//

import SwiftUI

struct FeaturedProductView: View {
    let viewModel: GalleryViewModel = GalleryViewModel(dataStore: ShopAPI.dataStore)
    var body: some View {
        Text("Must Haves, Best Sellers, and More")
            .font(.title2)
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 236))]) {
                ForEach(viewModel.carouselProducts) { product in
                    NavigationLink(destination: ItemDetailView(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)))) {
                        GalleryViewItem(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)), horizontal: true)
                    }
                }
            }
        }
    }
    
}

#Preview {
    FeaturedProductView()
}
