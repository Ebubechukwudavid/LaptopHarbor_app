class WishListManager {
  static final List<Map<String, dynamic>> wishListItems = [];

  static void addProduct(Map<String, dynamic> product) {
    // Avoid duplicates: if the product is already in the wishlist, do nothing.
    if (!wishListItems.any((item) => item['name'] == product['name'])) {
      wishListItems.add(product);
    }
  }
}
