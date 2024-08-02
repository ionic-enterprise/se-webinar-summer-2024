import SwiftUI

struct ItemDetailView: View {
    private let product: Product
    private let image: Image
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: HelpView()) {
                                Image(systemName: "questionmark.circle")
                            }
                        }
                    }
                    .navigationTitle(product.title)
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
                
                Text(product.title)
                    .font(.title)
                    .padding(.leading,16)
                Spacer()
                
                Text(product.formattedPrice!)
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .padding(.leading, 16)
                Spacer()
                
                Text(product.description)
                    .padding(.horizontal, 16)
                    .font(.body)
                HStack {
                    Spacer()
                    Button(action: {addToCart()}){
                        Text("Add to Cart")
                            .bold()
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    func addToCart() {

        ShopAPI.dataStore.cart.add(product: product, quantity: 1)
    }
    init(product: Product, image: Image) {
        self.product = product
        self.image = image
    }
}

struct ItemDetailView_Previews: PreviewProvider{
    static let product = Product(
        id: 1,
        title: "Capacitor Snapback",
        description: "",
        price: 32,
        imageName: "capacitor-hat.png",
        category: .featured)
    static var previews: some View {
        ItemDetailView(product: product, image: Image(uiImage: ImageLoader().imageFor(product.imageName)))
    }}
