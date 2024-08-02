import SwiftUI

struct CartView: View {
    private var viewModel = CartViewModel(dataStore: ShopAPI.dataStore)
       var body: some View {
           NavigationStack {
               VStack() {
                   CartListView(viewModel: viewModel)
               }.navigationTitle("Cart")
           }
           
       }
}


#Preview {
    CartView()
}
