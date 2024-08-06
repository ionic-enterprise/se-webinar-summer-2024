//
//  EditUserView.swift
//  NativeEcommerce
//
//  Created by Bryan Evans on 7/30/24.
//

import SwiftUI

struct EditUserView: View {
    let user: User = ShopAPI.dataStore.user
    @State private var fn: String = ShopAPI.dataStore.user.firstName
    @State private var ln: String = ShopAPI.dataStore.user.lastName
    @State private var email: String = ShopAPI.dataStore.user.email
    var body: some View {
        VStack(){
            Image(uiImage: ImageLoader().imageFor(self.user.imageName))
                .resizable()
                .frame(width: 128, height: 128, alignment: .center)
            HStack(){
                Text("First Name").padding(.leading, 16)
                Spacer()
                TextField("First Name", text: $fn)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Last Name").padding(.leading, 16)
                Spacer()
                TextField("", text: $ln)
                Spacer()
            }
            Divider()
            HStack(){
                Text("Email").padding(.leading, 16)
                TextField("", text: $email)
                Spacer()
            }
        }
    }

}

#Preview {
    EditUserView()
}
