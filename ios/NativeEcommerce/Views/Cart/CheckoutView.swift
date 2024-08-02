import SwiftUI

struct CheckoutView: View {
    @Environment(\.dismiss) var dismiss
    let subtotal: String
    let shop : ShopAPIPlugin = ShopAPIPlugin()
    var body: some View {
            NavigationStack(){
                Divider()
                VStack(alignment: .leading) {
                    UserDetails(profile: false)
                    Text("Review Total")
                        .font(.title)
                    Text(subtotal)
                        .font(.callout)
                    HStack {
                        Spacer()
                        Button(action: {
                            shop.checkoutResult("success")
                            dismiss()
                        }){
                            Text("Checkout")
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
                .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                        
                }
                .navigationTitle("Checkout")
                .navigationBarTitleDisplayMode(.inline)
            }
    }

}

#Preview {
    CheckoutView(subtotal: "23" )
}
