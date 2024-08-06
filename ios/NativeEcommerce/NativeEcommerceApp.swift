import SwiftUI
import IonicPortals

@main
struct NativeEcommerceApp: App {
    init() {
        PortalsRegistrationManager.shared.register(key: "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMDU2ZjBlNC1kYTFkLTQ1YWMtYWJjZi1hNDg3MzMyZTQwNGYifQ.ae25IRkMvYfd-fG8KKMt4ovyPigqwKJFDlKzBvnQlBTolTatTzTu4McRabVg8Ic2NWo3i7TEDm2DxF5oFgqYQB36h3lhRnH7noYOz2k_IH3p8fzXbFrJcCVgXfXR-ZPH9qZ1C6ikeNGCJF1gCBTeBWkxPNBcNM4ok-O7aeuMrxQaNZmFyiiaO5uVMQBfaQ0t0rwIFcMKYCorPn9Dw1tQgea2CBgW3k2mDfA9yHt6fjPBKIJhjaYJw00CTpIiUVVkQoswCr68X-dEwLm5dExR3hG9cp6xDfXA-Z1zszY2mxia40M3JddABXel67XV9rDnv1tlcJnlP8JBmR8kENm1Gg")
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
extension Portal {
    static let featured = Self(
        name: "featured",
        startDir: "my-app"
    ).adding(NavigationPlugin(viewModel: .default))
}
extension GalleryViewModel {
    static let `default` = GalleryViewModel(dataStore: ShopAPI.dataStore)
}
