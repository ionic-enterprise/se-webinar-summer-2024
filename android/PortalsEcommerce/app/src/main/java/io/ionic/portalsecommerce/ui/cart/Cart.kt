package io.ionic.portalsecommerce.ui.cart

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SheetState
import androidx.compose.material3.SheetValue
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateMapOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import io.ionic.portalsecommerce.data.ShoppingCart
import io.ionic.portalsecommerce.data.model.Product
import io.ionic.portalsecommerce.ui.address.AddressListItem
import io.ionic.portalsecommerce.ui.components.EcommerceBottomAppBar
import io.ionic.portalsecommerce.ui.components.EcommerceTopAppBar
import io.ionic.portalsecommerce.ui.components.ProductTile
import io.ionic.portalsecommerce.ui.navigation.MainDestinations
import io.ionic.portalsecommerce.ui.theme.PortalsEcommerceTheme
import kotlinx.coroutines.launch
import java.text.NumberFormat
import java.util.Currency
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Cart(onNavigateRoute: (String) -> Unit) {
    val context = LocalContext.current

    val cart = ShoppingCart.getInstance(context)
    val format: NumberFormat = NumberFormat.getCurrencyInstance()
    format.setMaximumFractionDigits(0)
    format.setCurrency(Currency.getInstance(Locale.US))

    val sheetState = rememberModalBottomSheetState(skipPartiallyExpanded = true)
    val scope = rememberCoroutineScope()
    var showBottomSheet by remember { mutableStateOf(false) }


    val viewContents = remember {
        mutableStateOf(hashMapOf<Product, Int>())
    }
    viewContents.value = HashMap(ShoppingCart.getInstance(context).contents)

    val badgeQuantity = remember {
        mutableStateOf(0)
    }
    badgeQuantity.value = cart.getUniqueItemCount()


    fun refreshCartData() {
        viewContents.value = HashMap(ShoppingCart.getInstance(context).contents)
        badgeQuantity.value = cart.getUniqueItemCount()
    }

    fun addItem(product: Product) {
        cart.addItem(product)
        refreshCartData()
    }

    fun removeItem(product: Product) {
        cart.removeItem(product)
        refreshCartData()
    }

    fun checkOut() {
        cart.contents.clear()
        refreshCartData()
        showBottomSheet = false
    }

    Scaffold (
        topBar = { EcommerceTopAppBar(title = "Cart") },
        bottomBar = { EcommerceBottomAppBar("home/cart", onNavigateRoute, badgeQuantity.value) }
    ) {
            paddingValues ->
        Column (
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize(),
            verticalArrangement = Arrangement.Center,
            horizontalAlignment = Alignment.CenterHorizontally
        ){
            if(viewContents.value.size == 0) {
                Column (
                    horizontalAlignment = Alignment.CenterHorizontally
                ){
                    Text(
                        text = "Your cart is empty",
                        style = MaterialTheme.typography.headlineSmall,
                        modifier = Modifier.padding(20.dp)
                    )
                    Button(
                        onClick = { onNavigateRoute(MainDestinations.HOME_ROUTE) },
                    ) {
                        Text( text = "Go Shop!" )
                    }
                }
            } else {
                Column (
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Top,
                    modifier = Modifier
                        .padding(20.dp)
                        .fillMaxHeight()
                        .verticalScroll(rememberScrollState())
                ){
                    Column (
                        modifier = Modifier.padding(bottom = 30.dp)
                    ) {
                        viewContents.value.forEach { cartItem ->
                            CartItem(cartItem.key, cartItem.value, { -> addItem(cartItem.key)},
                                { -> removeItem(cartItem.key) })
                        }
                    }
                    HorizontalDivider(color = MaterialTheme.colorScheme.primary, thickness = 1.dp, modifier = Modifier.padding(bottom = 20.dp))
                    Row (
                        modifier = Modifier
                            .fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                    ) {
                        Text(text = "Subtotal")
                        Text(text = "${format.format(cart.getTotalPriceOfProductsInCart())}")
                    }
                    Row (
                        modifier = Modifier
                            .fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                    ){
                        Text(text = "Shipping")
                        Text(text = "Standard - Free")
                    }
                    Row (
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = 20.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                    ){
                        Text(
                            text = "Estimated Total",
                            style = MaterialTheme.typography.headlineSmall)
                        Text(
                            text = "${format.format(cart.getTotalPriceOfProductsInCart())} + Tax",
                            style = MaterialTheme.typography.headlineSmall)
                    }
                    Button(
                        onClick = { showBottomSheet = true },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text( text = "Checkout")
                    }
                }
            }
            if (showBottomSheet) {
                ModalBottomSheet(
                    onDismissRequest = {
                        showBottomSheet = false
                    },
                    sheetState = sheetState,
                    modifier = Modifier
                        .fillMaxHeight()
                ) {
                    Row {
                        TextButton(onClick = {
                                scope.launch { sheetState.hide() }.invokeOnCompletion {
                                    if (!sheetState.isVisible) {
                                        showBottomSheet = false
                                    }
                                }
                            }
                            ) {
                            Icon(
                                imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                                contentDescription = "Back"
                            )
                        }
                        Column (
                            modifier = Modifier.fillMaxWidth(),
                            verticalArrangement = Arrangement.Center,
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Text("Checkout",
                                modifier = Modifier
                                    .offset(x= (-30).dp) )
                        }
                    }


                    CheckoutScreen({ checkOut() })

                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun CartPreview() {
    PortalsEcommerceTheme {
        Cart({})
    }
}