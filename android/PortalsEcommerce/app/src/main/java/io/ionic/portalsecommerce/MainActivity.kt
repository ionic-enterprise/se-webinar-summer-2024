package io.ionic.portalsecommerce

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import io.ionic.portals.PortalManager

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        PortalManager.register("eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMDU2ZjBlNC1kYTFkLTQ1YWMtYWJjZi1hNDg3MzMyZTQwNGYifQ.ae25IRkMvYfd-fG8KKMt4ovyPigqwKJFDlKzBvnQlBTolTatTzTu4McRabVg8Ic2NWo3i7TEDm2DxF5oFgqYQB36h3lhRnH7noYOz2k_IH3p8fzXbFrJcCVgXfXR-ZPH9qZ1C6ikeNGCJF1gCBTeBWkxPNBcNM4ok-O7aeuMrxQaNZmFyiiaO5uVMQBfaQ0t0rwIFcMKYCorPn9Dw1tQgea2CBgW3k2mDfA9yHt6fjPBKIJhjaYJw00CTpIiUVVkQoswCr68X-dEwLm5dExR3hG9cp6xDfXA-Z1zszY2mxia40M3JddABXel67XV9rDnv1tlcJnlP8JBmR8kENm1Gg")
//        PortalManager.register("YOUR_PORTALS_KEY")


        enableEdgeToEdge()
        setTheme(androidx.appcompat.R.style.Theme_AppCompat_Light)
        supportActionBar?.hide()
        setContent {
            PortalsEcommerceApp()
        }
    }
}
