import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';
import '../../../urls/urls.dart';

homePageProducts(BuildContext context) async {
  try {
    await Future.delayed(Duration(seconds: 2));
    final product = await getAll();
    final decoded = jsonDecode(product);
    final food = decoded as List<dynamic>;
    final products = food.map<LPG>((json) => LPG.fromJson(json)).toList();
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(SetLPGListAction(products));
    return products;
  } catch (error) {
    throw Exception('Error: Something Went Wrong$error!');
  }
}
