import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../models/orderDetailModel.dart';
import '../../../urls/urls.dart';

Future<Order> getOrderData(BuildContext context) async {
  final args = ModalRoute.of(context)!.settings.arguments as String;
  await Future.delayed(Duration(seconds: 2));
  final jsonData = await getOrderDetail(args);
  final decodedData = jsonDecode(jsonData);
  final order = Order.fromJson(decodedData);
  return order;
}
