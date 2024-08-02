import SwiftUI

struct DeliveryCard: View {
    @State private var delivery = true
    var user: User = ShopAPI.dataStore.user
    @State var addresses: [Address]
    let profile: Bool
    var body: some View {
        VStack(alignment: .leading){
        Text("Delivery")
            .font(.title2)
            .padding(.leading,16)
            ForEach(Array(addresses.enumerated()), id: \.offset){ index, address in
                HStack{
                    if(!self.profile){
                        Toggle("Delivery",systemImage: "checkmark", isOn: self.$delivery)
                            .tint(Color.blue)
                            .toggleStyle(.button)
                            .labelStyle(.iconOnly)
                            .foregroundStyle(self.delivery ? Color.blue : Color.white)
                    }
                    VStack (alignment: .leading){
                        Text(user.firstName + " " + user.lastName)
                        Text(address.street)
                        Text(address.city + ", " + address.state + " " + address.postalCode)
                    }
                    Spacer()
                    NavigationLink("Edit"){
                        EditAddressView(address: address, fullName: self.user.firstName + " " + self.user.lastName, index: index)
                    }
                }.padding()
            }
            HStack {
                Spacer()
                Button(action: {}){
                    NavigationLink(destination: EditAddressView(fullName: self.user.firstName + " " + self.user.lastName)){
                        Text("New Address")
                            .bold()
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.blue)
                            .background(Color(red: 225/255, green: 241/255, blue: 250/255))
                            .cornerRadius(12)
                    }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    mutating func updateUser(){
        
    }
    init(profile: Bool) {
        self.profile = profile
        _addresses = State(initialValue: user.addresses)
    }
}

#Preview {
    DeliveryCard(profile: true)
}
