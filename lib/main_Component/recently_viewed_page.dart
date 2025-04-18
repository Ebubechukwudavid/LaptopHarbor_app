import 'package:flutter/material.dart';

class RecentlyViewedPage extends StatelessWidget {
  // Dummy list of recently viewed product names.
  final List<String> recentlyViewed = [
    "MacBook Pro",
    "Dell XPS",
    "Lenovo ThinkPad",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recently Viewed"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: recentlyViewed.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              title: Text(
                recentlyViewed[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to the product detail page if desired.
              },
            ),
          );
        },
      ),
    );
  }
}
