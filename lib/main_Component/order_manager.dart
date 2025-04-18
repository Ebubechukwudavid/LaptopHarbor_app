class OrderManager {
  static final List<Map<String, dynamic>> orders = [];

  static void addOrder(Map<String, dynamic> order) {
    orders.add(order);
  }
}
