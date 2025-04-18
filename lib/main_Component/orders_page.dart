import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'order_manager.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Update the status of a specific order.
  void _updateOrderStatus(int index) {
    Map<String, dynamic> order = OrderManager.orders[index];
    String oldStatus = order["status"];
    String newStatus;
    if (oldStatus == "Processing") {
      newStatus = "Shipped";
      order["tracking"] = "Tracking Number: 123456789";
    } else if (oldStatus == "Shipped") {
      newStatus = "Out for Delivery";
    } else if (oldStatus == "Out for Delivery") {
      newStatus = "Delivered";
      order["tracking"] = "Delivered on ${DateFormat('MM/dd/yyyy').format(DateTime.now())}";
    } else {
      newStatus = oldStatus;
    }
    setState(() {
      order["status"] = newStatus;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Order ${order['id']} updated: $newStatus"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = OrderManager.orders;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: orders.isEmpty
          ? Center(
        child: Text(
          "No orders found.",
          style: TextStyle(fontSize: 24),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              title: Text("Order ${order['id']}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: ${order['date']}"),
                  Text("Status: ${order['status']}"),
                  Text("Item: ${order['details']}"),
                  Text("Shipping: ${order['shippingAddress']}"),
                  Text(order["tracking"],
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => _updateOrderStatus(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
