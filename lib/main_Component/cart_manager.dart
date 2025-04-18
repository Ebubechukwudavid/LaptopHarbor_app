class CartItem {
  final Map<String, dynamic> product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartManager {
  // A simple static list to hold cart items.
  static final List<CartItem> cartItems = [];

  // Add a product to the cart. If the product is already in the cart, increment its quantity.
  static void addProduct(Map<String, dynamic> product) {
    int index = cartItems.indexWhere((item) => item.product['name'] == product['name']);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  // Remove one unit of a product from the cart.
  // If the product's quantity is greater than 1, decrement the quantity.
  // Otherwise, remove the product entirely.
  static void removeOneUnit(int index) {
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    }
  }
}
