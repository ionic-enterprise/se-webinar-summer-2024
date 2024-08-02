import Combine
import Foundation

class ShopAPIPlugin {

    func getCart() -> Cart {
        let cart = ShopAPI.dataStore.cart
        return cart
    }

    func getUserDetails() -> User {
        let user = ShopAPI.dataStore.user
        return user
    }
    
    func updateUserDetails(_ user: User) {
        ShopAPI.dataStore.user = user
        
    }
    
    func checkoutResult(_ result: String) {
        let status = ShopAPI.CheckoutStatus(rawValue: result)!
        ShopAPI.checkoutStatusSubject.send(status)
    }
    
    func getUserPicture() -> String{
        let picture = ShopAPI.dataStore.userImage
        return picture
    }
    
    func setUserPicture(_ picture: String) {
        ShopAPI.dataStore.userImage = picture
    }
}

public enum ShopAPI {
    enum CheckoutStatus: String {
        case completed = "success"
        case canceled = "cancel"
        case failed = "failure"
    }
    
    static let dataStore: DataStoreViewModel = {
        guard
            let url = Bundle.main.url(forResource: "data", withExtension: ".json"),
            let data = try? Data(contentsOf: url),
            let demo = try? JSONDecoder().decode(DemoData.self, from: data)
        else { fatalError("Failed to load demo JSON")}
        
        return DataStoreViewModel(with: demo.user, products: demo.products, imageLoader: ImageLoader())
    }()
    
    fileprivate static let checkoutStatusSubject = PassthroughSubject<CheckoutStatus, Never>()
    static var checkoutStatusPublisher: AnyPublisher<CheckoutStatus, Never> {
        checkoutStatusSubject.eraseToAnyPublisher()
    }
}
