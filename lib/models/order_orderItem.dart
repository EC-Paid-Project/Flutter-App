class Order {
  int orderId = -1;
  int userId;
  String distributor;
  Order(this.userId, this.distributor);
  Order.fromJson(Map<String, dynamic> json)
      : orderId = json['order_id'],
        userId = json['user_id'],
        distributor = json['distributor'];
  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'distributor': distributor,
      };
}

class OrderItem {
  int itemId = -1;
  int orderId;
  int foodId;
  int quantity;
  OrderItem(this.orderId, this.foodId, this.quantity);
  OrderItem.fromJson(Map<String, dynamic> json)
      : itemId = json['item_id'],
        orderId = json['order_id'],
        foodId = json['food_id'],
        quantity = json['quantity'];
  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'food_id': foodId,
        'quantity': quantity,
      };
}
