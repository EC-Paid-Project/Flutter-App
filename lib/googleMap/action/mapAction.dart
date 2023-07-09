import 'dart:convert';
import 'package:flutter_ecommerce_app/models/distributor.dart';
import '../../urls/urls.dart';

fetchDistributorData() async {
  await Future.delayed(const Duration(seconds: 2));
  final response = await getDistrbutor();
  if (response != null) {
    final data = json.decode(response) as List<dynamic>;
    return data.map<Distributor>((item) => Distributor.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch distributor data');
  }
}
