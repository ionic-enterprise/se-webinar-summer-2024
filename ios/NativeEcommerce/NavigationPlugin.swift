import Foundation
import SwiftUI
import Capacitor

class NavigationPlugin: CAPInstancePlugin, CAPBridgedPlugin {
    private let viewModel : GalleryViewModel
    
    let jsName = "Navigation"
    let identifier = "Navigation"
    let pluginMethods: [CAPPluginMethod] = [
        .init(name: "selectProduct", returnType: CAPPluginReturnPromise)
    ]

    @objc func selectProduct(_ call: CAPPluginCall) {
        guard let id = call.getInt("id") else{
            return
        }
        viewModel.selectProduct(by: id)
        call.resolve()
    }
    init(viewModel: GalleryViewModel) {
        self.viewModel = viewModel
        super.init()
    }
 
}
