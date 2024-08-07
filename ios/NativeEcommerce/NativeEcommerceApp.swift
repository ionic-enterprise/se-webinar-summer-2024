import SwiftUI

@main
struct NativeEcommerceApp: App {

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
extension GalleryViewModel {
    static let `default` = GalleryViewModel(dataStore: ShopAPI.dataStore)
}
