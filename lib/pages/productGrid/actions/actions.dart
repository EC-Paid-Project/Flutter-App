import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';
import '../../../urls/urls.dart';

Future<dynamic> getAllProduct(BuildContext context) async {
  try {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final List<LPG> storedProducts = store.state.lpgList;
    final jsonString = ModalRoute.of(context)?.settings.arguments as String?;
    await Future.delayed(const Duration(seconds: 2));

    if (jsonString != null && jsonString.isNotEmpty) {
      final jsonData = jsonDecode(jsonString);
      final search = jsonData['search'];
      final size = jsonData['size'];
      final price = jsonData['price'];
      if (search != null && storedProducts.isNotEmpty) {
        final filteredProducts = storedProducts
            .where((product) =>
                product.title.toLowerCase().contains(search.toLowerCase()))
            .toList();
        if (price != null && price is String) {
          if (price == "Min") {
            final sortedProducts = filteredProducts.toList()
              ..sort((a, b) => a.price.compareTo(b.price));
            return sortedProducts;
          } else if (price == "Max") {
            final sortedProducts = filteredProducts.toList()
              ..sort((a, b) => b.price.compareTo(a.price));
            return sortedProducts;
          }
        }
        if (size != null && size is String) {
          if (size == "Small") {
            final filteredBySizeProducts =
                filteredProducts.where((product) => product.size < 5).toList();
            return filteredBySizeProducts;
          } else if (size == "Medium") {
            final filteredBySizeProducts = filteredProducts
                .where((product) => product.size >= 5 && product.size <= 15)
                .toList();
            return filteredBySizeProducts;
          } else if (size == "Large") {
            final filteredBySizeProducts =
                filteredProducts.where((product) => product.size > 15).toList();
            return filteredBySizeProducts;
          }
        }
        return filteredProducts;
      } else {
        final product = await getAll();
        final decoded = jsonDecode(product);
        if (decoded.length > 1) {
          final food = decoded as List<dynamic>;
          final products = food.map<LPG>((json) => LPG.fromJson(json)).toList();
          store.dispatch(SetLPGListAction(products));
          if (search != null) {
            final filteredProducts = products.where((product) =>
                product.title.toLowerCase().contains(search.toLowerCase()));

            if (price != null && price is String) {
              if (price == "Min") {
                final sortedProducts = filteredProducts.toList()
                  ..sort((a, b) => a.price.compareTo(b.price));
                return sortedProducts;
              } else if (price == "Max") {
                final sortedProducts = filteredProducts.toList()
                  ..sort((a, b) => b.price.compareTo(a.price));
                return sortedProducts;
              }
            }
            if (size != null && size is String) {
              if (size == "Small") {
                final filteredBySizeProducts = filteredProducts
                    .where((product) => product.size < 5)
                    .toList();
                return filteredBySizeProducts;
              } else if (size == "Medium") {
                final filteredBySizeProducts = filteredProducts
                    .where((product) => product.size >= 5 && product.size <= 15)
                    .toList();
                return filteredBySizeProducts;
              } else if (size == "Large") {
                final filteredBySizeProducts = filteredProducts
                    .where((product) => product.size > 15)
                    .toList();
                return filteredBySizeProducts;
              }
            }
            return filteredProducts.toList();
          } else {
            return products;
          }
        }

        if (decoded.length == 1) {
          final product = LPG.fromJson(decoded);
          if (search != null &&
              product.title.toLowerCase().contains(search.toLowerCase())) {
            store.dispatch(SetLPGListAction([product]));
            return product;
          } else {
            return null;
          }
        }
      }
    } else {
      if (storedProducts.isNotEmpty) {
        return storedProducts;
      } else {
        final product = await getAll();
        final decoded = jsonDecode(product);
        final food = decoded as List<dynamic>;
        final products = food.map<LPG>((json) => LPG.fromJson(json)).toList();
        store.dispatch(SetLPGListAction(products));
        return products;
      }
    }
  } catch (error) {
    throw Exception('Error: Something Went Wrong!');
  }
}
