class OrderHistoryData {
  final int id;
  final String date;
  final String status;
  final int totalItemsQty;

  OrderHistoryData({
    required this.id,
    required this.date,
    required this.status,
    required this.totalItemsQty,
  });

  OrderHistoryData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        status = json['status'],
        totalItemsQty = json['total_items_qty'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'status': status,
        'total_items_qty': totalItemsQty,
      };
}
