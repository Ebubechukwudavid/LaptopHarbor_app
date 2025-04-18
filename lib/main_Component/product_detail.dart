import 'package:flutter/material.dart';
import 'cart_manager.dart'; // Ensure CartManager is implemented.
import 'cart_page.dart';
import 'welcome_page.dart'; // To navigate back to WelcomePage.
import 'wish_list_manager.dart'; // Ensure WishListManager is implemented.
import 'wishlist_page.dart'; // New page to view wishlist items.

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product; // Contains product details including additionalImages, price, etc.

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final TextEditingController _reviewController = TextEditingController();

  // Dummy list of reviews.
  List<String> reviews = [
    "Great laptop! Highly recommended.",
    "Excellent performance and build quality.",
  ];

  // The current image shown as the main product image.
  late String currentMainImage;

  @override
  void initState() {
    super.initState();
    currentMainImage = widget.product['image'];
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    if (_reviewController.text.trim().isNotEmpty) {
      setState(() {
        reviews.add(_reviewController.text.trim());
        _reviewController.clear();
      });
    }
  }

  // Function to add product to cart.
  void _addToCart(Map<String, dynamic> product) {
    CartManager.addProduct(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully added to cart"),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Function to add product to wishlist and navigate to the Wishlist page.
  void _addToWishlist(Map<String, dynamic> product) {
    WishListManager.addProduct(product);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WishListPage()),
    );
  }

  // Returns the current quantity of this product in the cart.
  int _getCurrentQuantity() {
    int index = CartManager.cartItems.indexWhere(
          (item) => item.product['name'] == widget.product['name'],
    );
    return index >= 0 ? CartManager.cartItems[index].quantity : 0;
  }

  // Show a modal bottom sheet for modifying the product quantity.
  void _showCartModificationPanel() {
    int currentQuantity = _getCurrentQuantity();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setModalState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: 150,
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Decrement container.
                    GestureDetector(
                      onTap: () {
                        setModalState(() {
                          int index = CartManager.cartItems.indexWhere(
                                (item) =>
                            item.product['name'] ==
                                widget.product['name'],
                          );
                          if (index >= 0 && currentQuantity > 0) {
                            CartManager.removeOneUnit(index);
                            currentQuantity = _getCurrentQuantity();
                          }
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "$currentQuantity",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 16),
                    // Increment container.
                    GestureDetector(
                      onTap: () {
                        setModalState(() {
                          CartManager.addProduct(widget.product);
                          currentQuantity = _getCurrentQuantity();
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {}); // Refresh after modification.
                  },
                  child: Text("Done"),
                )
              ],
            ),
          );
        });
      },
    );
  }

  // Renamed phone function.
  void _displayPhoneNumber() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Call: 09038490942"),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final List<dynamic> additionalImages = product['additionalImages'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (additionalImages.isNotEmpty) ...[
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: additionalImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentMainImage = additionalImages[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            additionalImages[index],
                            width: 100,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
            Center(
              child: Image.asset(
                currentMainImage,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product['name'],
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product['Brand'] ?? "",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              "Price: ${product['price']}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              product['stock'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _addToCart(product),
              icon: Icon(Icons.shopping_cart),
              label: Text("Add to cart"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            SizedBox(height: 16),
            // Add Wishlist button (without extra background color styling).
            ElevatedButton.icon(
              onPressed: () => _addToWishlist(product),
              icon: Icon(Icons.favorite_border),
              label: Text("Add Wishlist"),
            ),
            SizedBox(height: 30),
            if (product.containsKey('desc'))
              Text(
                product['desc'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 12),
            Text(
              "Specifications:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product['specifications'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 4),
                Text(
                  "${product['rating']} (${product['reviewCount']} reviews)",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "User Reviews:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(reviews[index]),
                );
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: "Leave a review...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _submitReview,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text("Submit Review"),
            ),
          ],
        ),
      ),
      // Sticky footer with background for each icon container.
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Home icon container.
              Container(
                width: 80,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                          (route) => false,
                    );
                  },
                ),
              ),
              // Phone call icon container.
              Container(
                width: 80,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Call: 09038490942"),
                        backgroundColor: Colors.blueAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
              // Cart icon container (Expanded to reach the edges).
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: _showCartModificationPanel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
