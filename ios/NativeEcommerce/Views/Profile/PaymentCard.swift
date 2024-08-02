import SwiftUI

struct PaymentCard: View {
    let user: User = ShopAPI.dataStore.user
    let profile: Bool
    @State var card = true
    var body: some View {
        VStack(alignment:.leading){
            Text("Payment")
                .font(.title2)
                .padding(.leading,16)
            ForEach(Array(user.creditCards.enumerated()), id: \.offset) { index, item in
                HStack{
                    if(!self.profile){
                        Toggle("Payment",systemImage: "checkmark", isOn: self.$card)
                            .tint(Color.blue)
                            .toggleStyle(.button)
                            .labelStyle(.iconOnly)
                            .foregroundStyle(self.card ? Color.blue : Color.white)
                    }
                    Text(item.company + " ending in " + item.number.suffix(4))
                    Spacer()
                    NavigationLink("Edit"){
                        EditPaymentView(card: item, index: index)
                    }
                }.padding()
            }
               
                HStack {
                    Spacer()
                    Button(action:{}){
                        NavigationLink(destination: EditPaymentView()){
                            Text("New Payment Method")
                                .bold()
                                .padding(20)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.blue)
                            //203, 231, 247
                                .background(Color(red: 225/255, green: 241/255, blue: 250/255))
                                .cornerRadius(12)
                        }
                    }
                    Spacer()
                }
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    init( profile: Bool) {
        self.profile = profile
    }
}

#Preview {
    PaymentCard(profile: true)
}
