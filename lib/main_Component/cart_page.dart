import 'package:flutter/material.dart';
import 'cart_manager.dart';
import 'product_detail.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeOneUnit(int index) {
    setState(() {
      CartManager.removeOneUnit(index);
    });
  }

  void _navigateToProductDetail(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  void _navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: CartManager.cartItems.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty.",
          style: TextStyle(fontSize: 24),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: CartManager.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = CartManager.cartItems[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              onTap: () {
                _navigateToProductDetail(cartItem.product);
              },
              leading: Image.asset(
                cartItem.product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(cartItem.product['name']),
              subtitle: Text(
                  "Quantity: ${cartItem.quantity}\nPrice: ${cartItem.product['price']}"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeOneUnit(index),
              ),
            ),
          );
        },
      ),
      // Show Checkout button only if there is at least one item in cart.
      bottomNavigationBar: CartManager.cartItems.isNotEmpty
          ? Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ElevatedButton(
          onPressed: _navigateToCheckout,
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
        ),
      )
          : null,
    );
  }
}
