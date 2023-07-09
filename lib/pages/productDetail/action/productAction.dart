import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';
import '../../../models/food_and_category.dart';

productDetailLoad(BuildContext context) async {
  try {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    await Future.delayed(Duration(seconds: 2));
    final a = await getOne(args);
    final decode = jsonDecode(a);
    final LPG lpg = LPG.fromJson(decode);
    return lpg;
  } catch (error) {
    throw Exception('Error: Something Went Wrong!');
  }
}
