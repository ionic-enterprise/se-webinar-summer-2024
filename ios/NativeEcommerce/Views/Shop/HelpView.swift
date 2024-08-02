import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Get Assistance")
                .font(.title)
                .padding()
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .padding()
            Text("help@portals.ionic.io")
                .font(.callout)
                .padding()
            Text("1-800-PORTALS")
                .font(.callout)
                .padding()
            Spacer()
        }.padding()
    }
}

#Preview {
    HelpView()
}
