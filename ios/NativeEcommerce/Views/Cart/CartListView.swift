import SwiftUI

struct CartListView: View {
    @ObservedObject private var viewModel: CartViewModel
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.contents.isEmpty {
           Text("Your cart is empty")
                .font(.title)
        } else {
            List {
                ForEach(viewModel.contents) { item in
                    CartItemView(
                        item: item,
                        image: Image(uiImage: viewModel.image(named: item.product.imageName)),
                        onSelectQuantity: { quantity in
                            viewModel.update(product: item.product, with: quantity)
                        }
                    )
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: viewModel.deleteProducts)
                
                CartFooterView(total: viewModel.cartTotal) {
                    viewModel.shouldDisplayCheckout = true
                }
                .listSectionSeparator(.hidden)
                .buttonStyle(.plain)
                .padding(.top, 16)
            }
            .listStyle(.plain)
            .sheet(isPresented: $viewModel.shouldDisplayCheckout) {
                CheckoutView(subtotal: viewModel.cartTotal)
            }
        }
    }
}

extension Cart.Item: Identifiable {
    var id: Int { product.id }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CartListView(viewModel: .debug)
                .navigationTitle("Cart")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

