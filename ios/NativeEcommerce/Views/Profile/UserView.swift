import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationStack{
            Divider()
            ScrollView(){
                VStack {
                    EditUserView()
                    UserDetails(profile: true)
                }.navigationTitle("Profile")
            }
        }
    }
}

#Preview {
    UserView()
}
