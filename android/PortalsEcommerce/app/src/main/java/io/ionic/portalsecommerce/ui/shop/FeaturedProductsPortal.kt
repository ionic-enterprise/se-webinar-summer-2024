package io.ionic.portalsecommerce.ui.shop

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import io.ionic.portals.PortalManager
import io.ionic.portals.PortalView
import io.ionic.portalsecommerce.NavigationPlugin
import io.ionic.portalsecommerce.ui.navigation.EcommerceNavController

@Composable
fun FeaturedProductsPortal(onProductClick: (Int) -> Unit) {

    PortalManager
        .newPortal("featured-products")
        .setStartDir("portals/featured-products")
        .addPluginInstance(NavigationPlugin(onProductClick))
        .create()

    AndroidView(
        modifier = Modifier.height(350.dp).fillMaxWidth(),
        factory = { PortalView(it, "featured-products")}
    )
}