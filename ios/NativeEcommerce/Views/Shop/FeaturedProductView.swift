import SwiftUI
import IonicPortals
struct FeaturedProductView: View {
    var body: some View {
        VStack(){
            PortalView(portal: .featured )
                .frame(width: .infinity, height: 350)
                .padding(.horizontal, -16)

        }
    }
}

#Preview {
    FeaturedProductView()
}
