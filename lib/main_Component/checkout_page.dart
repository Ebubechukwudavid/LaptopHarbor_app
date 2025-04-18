import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart_manager.dart';
import 'order_manager.dart';
import 'orders_page.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _shippingController = TextEditingController();
  final _billingController = TextEditingController();

  // Calculates the subtotal by iterating over the cart items.
  double _calculateSubtotal() {
    double subtotal = 0.0;
    for (var item in CartManager.cartItems) {
      String priceStr = item.product['price'].replaceAll(RegExp(r'[^\d.]'), '');
      double price = double.tryParse(priceStr) ?? 0.0;
      subtotal += price * item.quantity;
    }
    return subtotal;
  }

  // Calculate the total including tax and shipping.
  double _calculateTotal() {
    double subtotal = _calculateSubtotal();
    double tax = subtotal * 0.10; // 10% tax.
    double shippingFee = 20.0;    // Fixed shipping fee.
    return subtotal + tax + shippingFee;
  }

  // Place orders for each product in the cart.
  void _placeOrder() {
    double subtotal = _calculateSubtotal();
    double tax = subtotal * 0.10;
    double shippingFee = 20.0;
    double totalAmount = _calculateTotal();

    // For each cart item, create a separate order.
    for (var item in CartManager.cartItems) {
      Map<String, dynamic> order = {
        "id": "#${DateTime.now().millisecondsSinceEpoch}",
        "date": DateFormat('MM/dd/yyyy').format(DateTime.now()),
        "status": "Processing",
        "details": item.product['name'],
        "tracking": "Awaiting shipment",
        "shippingAddress": _shippingController.text,
        "billingAddress": _billingController.text,
        // Calculate order total for this product.
        "subtotal": double.tryParse(item.product['price'].replaceAll(RegExp(r'[^\d.]'), ''))! * item.quantity,
        "tax": (double.tryParse(item.product['price'].replaceAll(RegExp(r'[^\d.]'), ''))! * item.quantity) * 0.10,
        "shippingFee": shippingFee, // You may decide to apply shipping fee per order or overall.
        "total": (double.tryParse(item.product['price'].replaceAll(RegExp(r'[^\d.]'), ''))! * item.quantity) +
            ((double.tryParse(item.product['price'].replaceAll(RegExp(r'[^\d.]'), ''))! * item.quantity) * 0.10) +
            shippingFee,
      };
      OrderManager.addOrder(order);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Order placed successfully! Total: \$${totalAmount.toStringAsFixed(2)}. A confirmation email has been sent.",
        ),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the cart.
    setState(() {
      CartManager.cartItems.clear();
    });

    // Navigate to the Orders page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OrdersPage()),
    );
  }

  @override
  void dispose() {
    _shippingController.dispose();
    _billingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = _calculateSubtotal();
    double tax = subtotal * 0.10;
    double shippingFee = 20.0;
    double totalAmount = _calculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Information.
            Text(
              "Shipping Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _shippingController,
              decoration: InputDecoration(
                hintText: "Enter shipping address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Billing Information.
            Text(
              "Billing Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _billingController,
              decoration: InputDecoration(
                hintText: "Enter billing address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Order Summary.
            Text(
              "Order Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Subtotal: \$${subtotal.toStringAsFixed(2)}"),
            Text("Tax (10%): \$${tax.toStringAsFixed(2)}"),
            Text("Shipping Fee: \$${shippingFee.toStringAsFixed(2)}"),
            Divider(thickness: 1, height: 20),
            Text(
              "Total Amount: \$${totalAmount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _placeOrder,
                child: Text(
                  "Place Order",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
