import 'package:flutter/material.dart';
import 'wish_list_manager.dart';
import 'product_detail.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    final wishList = WishListManager.wishListItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist"),
      ),
      body: wishList.isEmpty
          ? Center(
        child: Text(
          "Your wishlist is empty.",
          style: TextStyle(fontSize: 24),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          final product = wishList[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: Image.asset(
                product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                product['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    WishListManager.wishListItems.removeAt(index);
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
