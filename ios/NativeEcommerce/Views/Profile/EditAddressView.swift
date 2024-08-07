import SwiftUI

struct EditAddressView: View {
    @Environment(\.dismiss)  private var dismiss
    var edit: Bool = true
    var index: Int
    @State private var fullName: String
    @State private var address: String
    @State private var zipCode: String
    @State private var city: String
    @State private var state: String
    let shopApi = ShopAPIPlugin()
    
    var body: some View {
        VStack(alignment:.leading){
        Divider()
            HStack(){
                Text("Full Name").padding(.leading, 16)
                Spacer()
                TextField("Full Name", text: $fullName)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Address").padding(.leading, 16)
                Spacer()
                TextField("", text: $address)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Zip Code").padding(.leading, 16)
                TextField("", text: $zipCode)
                Spacer()
            }
            Divider()
            HStack(){
                Text("City").padding(.leading, 16)

                TextField("", text: $city)
                Spacer()
            }
            Divider()
            HStack(){
                Text("State").padding(.leading, 16)

                TextField("", text: $state)
                Spacer()
            }
            Divider()
        }.navigationTitle("Address")
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
        if index == user.addresses.count{
            user.addresses.append(Address(id: index, street: self.address, city: self.city, state: self.state, postalCode: self.zipCode, isPreferred: true))
        }else{
            user.addresses[index] = Address(id: index, street: self.address, city: self.city, state: self.state, postalCode: self.zipCode, isPreferred: true)
        }
        shopApi.updateUserDetails(user)
        dismiss()
    }
    init(address: Address, fullName: String, index: Int) {
        self.index = index
        _fullName = State(initialValue:fullName)
        _address = State(initialValue:address.street)
        _zipCode = State(initialValue:address.postalCode)
        _city = State(initialValue:address.city)
        _state = State(initialValue:address.state)
    }
    init(fullName: String){
        self.index = shopApi.getUserDetails().addresses.endIndex
        self.edit = false
        _fullName = State(initialValue:fullName)
        _address = State(initialValue:"")
        _zipCode = State(initialValue:"")
        _city = State(initialValue:"")
        _state = State(initialValue:"")
    }
}

#Preview {
    EditAddressView(fullName: "Josh Thomas")
}
