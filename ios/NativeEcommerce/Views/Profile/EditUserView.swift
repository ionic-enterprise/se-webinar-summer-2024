//
//  EditUserView.swift
//  NativeEcommerce
//
//  Created by Bryan Evans on 7/30/24.
//

import SwiftUI

struct EditUserView: View {
    let user: User = ShopAPI.dataStore.user
    @State var fn: String
    @State var ln: String
    @State var email: String
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
    init(){
        _fn = State(initialValue: user.firstName)
        _ln = State(initialValue: user.lastName)
        _email = State(initialValue: user.email)
    }
}

#Preview {
    EditUserView()
}
