import SwiftUI

struct EditPaymentView: View {
    @Environment(\.dismiss)  private var dismiss
    var edit: Bool = true
    var index: Int
    @State var company: String
    @State var cardNumber: String
    @State var expiration: String
    @State var cvv: String
    @State var zipCode: String
    let shopApi = ShopAPIPlugin()
    
    var body: some View {
        VStack(alignment:.leading){
        Divider()
            HStack(){
                Spacer()
                TextField("Company", text: $company).padding(.leading, 16)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Card Number").padding(.leading, 16)
                Spacer()
                TextField("", text: $cardNumber)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Expiration Date").padding(.leading, 16)

                TextField("", text: $expiration)
                Spacer()
            }
            Divider()
            HStack(){
                Text("CVV").padding(.leading, 16)

                TextField("", text: $cvv)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Zip Code").padding(.leading, 16)
                TextField("", text: $zipCode)
                Spacer()
            }
            Divider()
        }.navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
        HStack {
            Spacer()
            Button(action: {updateAddress()}){
                    Text("Save")
                        .bold()
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.blue)
                        .background(Color(red: 225/255, green: 241/255, blue: 250/255))
                        .cornerRadius(12)
            }
            Spacer()
        }
        Spacer()
    }
    func updateAddress() {
        var user = shopApi.getUserDetails()
        if index == user.creditCards.count{
            user.creditCards.append(CreditCard(id: index, company: self.company, number: self.cardNumber, expiration: self.expiration, cvv: self.cvv, zip: self.zipCode))
        }else{
            user.creditCards[index] = CreditCard(id: index, company: self.company, number: self.cardNumber, expiration: self.expiration, cvv: self.cvv, zip: self.zipCode)
        }
        shopApi.updateUserDetails(user)
        dismiss()
    }
    init(card: CreditCard, index: Int) {
        self.index = index
        _cardNumber = State(initialValue:card.number)
        _company = State(initialValue:card.company)
        _zipCode = State(initialValue:card.zip)
        _cvv = State(initialValue:card.cvv)
        _expiration = State(initialValue:card.expiration)
    }
    init(){
        self.index = shopApi.getUserDetails().addresses.endIndex
        self.edit = false
        _cardNumber = State(initialValue:"")
        _company = State(initialValue:"")
        _zipCode = State(initialValue:"")
        _cvv = State(initialValue:"")
        _expiration = State(initialValue:"")
    }
}

#Preview {
    EditPaymentView()
}
