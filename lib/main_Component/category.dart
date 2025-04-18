import 'package:flutter/material.dart';
import 'package:demo/Details/apple_laptops_page.dart';
import 'package:demo/Details/dell_laptops_page.dart';
import 'package:demo/Details/gaming_laptops_page.dart';

class CategoryPage extends StatelessWidget {
  final String selectedCategory;

  const CategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (selectedCategory) {
      case "Apple Laptops":
        return AppleLaptopsPage();
      case "Dell Laptops":
        return DellLaptopsPage();
      case "Gaming Laptops":
        return GamingLaptopsPage();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text("Category: $selectedCategory"),
            elevation: 2,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category_outlined,
                  size: 64,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  "Displaying items for $selectedCategory",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
    }
  }
}
