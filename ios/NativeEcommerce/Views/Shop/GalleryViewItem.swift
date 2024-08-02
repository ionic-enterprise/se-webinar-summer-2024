import SwiftUI

struct GalleryViewItem: View {
    private let product: Product
    private let image: Image
    private let horizontal: Bool
    var body: some View {
        VStack(alignment: .leading){
            image
                .resizable()
                .frame(width: self.horizontal ? 236 : 178, height: self.horizontal ? 236 : 178, alignment: .center)
                .cornerRadius(12)
            Text(product.title)
                .font(.callout)
                .foregroundStyle(Color.black)
            Text(product.formattedPrice!)
                .font(.callout)
                .foregroundStyle(Color.gray)
        }        .frame(maxWidth: .infinity, alignment: .leading)

            
    }
    init(product: Product, image: Image, horizontal: Bool) {
        self.product = product
        self.image = image
        self.horizontal = horizontal
    }
}

struct GalleryViewItem_Previews: PreviewProvider {
    
    static let product = Product(
        id: 1,
        title: "Capacitor Snapback",
        description: "",
        price: 32,
        imageName: "capacitor-hat.png",
        category: .featured)
    static var previews: some View {
        GalleryViewItem(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)), horizontal: true)
    }
}
