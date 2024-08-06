package io.ionic.portalsecommerce

import android.os.Looper
import androidx.navigation.NavBackStackEntry
import com.getcapacitor.Plugin
import com.getcapacitor.PluginCall
import com.getcapacitor.PluginMethod
import com.getcapacitor.annotation.CapacitorPlugin
import io.ionic.portalsecommerce.ui.navigation.EcommerceNavController
import java.util.logging.Handler

@CapacitorPlugin(name = "Navigation")
class NavigationPlugin(val onProductClick: (Int) -> Unit) : Plugin() {


    @PluginMethod()
    fun selectProduct(call: PluginCall) {

        val id = call.getInt("id")
        if (id == null) {
            call.reject("Input option 'id' must be provided.")
            return
        }
        nativeNavigation(id)

        call.resolve()
    }

    private fun nativeNavigation(id: Int) {
        android.os.Handler(Looper.getMainLooper()).post {
            onProductClick(id)
        }
    }
}