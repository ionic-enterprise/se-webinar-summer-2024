import SwiftUI

struct UserDetails: View {
    let profile: Bool
    var body: some View {
        NavigationStack{
            DeliveryCard(profile: self.profile)
            PaymentCard(profile: self.profile)
        }
    }
    init( profile: Bool) {
        self.profile = profile
    }
    
}

#Preview {
    UserDetails(profile: true)
}
