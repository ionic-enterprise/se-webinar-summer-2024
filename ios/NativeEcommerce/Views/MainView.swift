import SwiftUI

struct MainView: View {
    var body: some View {
            TabView{
                ShopView()        .navigationBarTitleDisplayMode(.large) // ⬅️ Important part
                
                    .navigationTitle("Shop")
                    .tabItem {
                        Label("", systemImage:"square.grid.2x2")
                    }
                CartView()
                    .tabItem {
                        Label("",systemImage: "basket")
                    }
                UserView()
                    .tabItem {
                        Label("", systemImage: "person")
                    }
            }
        

    }
}

#Preview {
    MainView()
}
