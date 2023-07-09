class OrderInfo {
  final int id;
  final String date;
  final String status;
  final int totalItemsQty;
  final String address;
  final int totalPrice;
  final int order;
  final int distributor;
  OrderInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        date = json['date'] ?? '',
        status = json['status'] ?? '',
        totalItemsQty = json['total_items_qty'] ?? 0,
        address = json['address'] ?? '',
        totalPrice = json['total_price'] ?? 0,
        order = json['order'] ?? 0,
        distributor = json['distributor'] ?? 0;
}

class OrderItem {
  final int id;
  final int quantity;
  final int price;
  final int order;
  final int cylinder;
  OrderItem.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        quantity = json['quantity'] ?? 0,
        price = json['price'] ?? 0.0,
        order = json['order'] ?? 0,
        cylinder = json['cylinder'] ?? 0;
}

class Order {
  final OrderInfo orderInfo;
  final List<OrderItem> orderItems;
  Order.fromJson(Map<String, dynamic> json)
      : orderInfo = OrderInfo.fromJson(json['order_info'] ?? {}),
        orderItems = (json['order_item'] as List<dynamic>?)
                ?.map((item) => OrderItem.fromJson(item))
                .toList() ??
            [];
}
