import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/reduxStore/app_state.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../models/food_and_category.dart';

productDetailLoad(BuildContext context)async{

  //  final con=Uri.base.pathSegments.last;
  //  print(con);
  await Future.delayed(Duration(seconds: 2));
  final a=await getOne(1);
  final decode=jsonDecode(a);
  final Food food=Food.fromJson(decode);
  print(food.image+"sjk");
  // final store=StoreProvider.of<AppState>(context);
// final product=store.state.food;
// final a=product.map<Food>((json)=>Food.fromJson(json));
// Food.fromJson(product);
return food;

}