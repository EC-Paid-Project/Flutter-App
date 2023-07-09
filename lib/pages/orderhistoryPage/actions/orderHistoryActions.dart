import 'dart:convert';
import '../../../models/orderHistory.dart';
import '../../../urls/urls.dart';

Future<List<OrderHistoryData>> fetchOrderHistory() async {
  try {
    final response = await getOrderHistory();
    final decoded = jsonDecode(response) as List<dynamic>;
    await Future.delayed(Duration(seconds: 2));
    final orderHistoryDataList = decoded
        .map<OrderHistoryData>((data) => OrderHistoryData.fromJson(data))
        .toList();
    return orderHistoryDataList;
  } catch (error) {
    throw Exception('Error: Something Went Wrong!');
  }
}
