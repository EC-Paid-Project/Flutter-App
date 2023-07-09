import 'food_and_category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Cart {
  List<LPG> lpg = [];
  Cart();
  Cart.fromJson(Map<String, dynamic> json) {
    List<dynamic> lpgJson = json['lpg'];
    lpg = lpgJson.map((itemJson) => LPG.fromJson(itemJson)).toList();
  }
  Map<String, dynamic> toJson() => {
        'lpg': lpg.map((item) => item.toJson()).toList(),
      };

  void addItem(LPG item) {
    bool itemExists = false;
    for (int i = 0; i < lpg.length; i++) {
      if (lpg[i].id == item.id) {
        lpg[i].quantity += 1;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      lpg.add(item);
    }
  }

  void removeItem(int id) {
    for (int i = lpg.length - 1; i >= 0; i--) {
      if (lpg[i].id == id) {
        if (lpg[i].quantity > 1) {
          lpg[i].quantity -= 1;
        } else {
          lpg.removeAt(i);
        }
        break;
      }
    }
  }

  void clearCart() {
    lpg.clear();
  }

  double getSubtotal() {
    double subtotal = 0;
    for (var item in lpg) {
      subtotal += item.price * item.quantity;
    }
    return subtotal;
  }

  double getDeliveryCharges() {
    if (lpg.isEmpty) {
      return 0;
    } else {
      return 5;
    }
  }

  double getTotal() {
    return getSubtotal() + getDeliveryCharges();
  }

  int getItemCount(int id) {
    int count = 0;
    for (var item in lpg) {
      if (item.id == id) {
        count += item.quantity;
      }
    }
    return count;
  }
}

void saveCartToSession(Cart cart) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String cartJson = jsonEncode(cart.toJson());
  await prefs.setString('cart', cartJson);
}

Future<Cart> getCartFromSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? cartJson = prefs.getString('cart');
  if (cartJson != null) {
    Map<String, dynamic> cartMap = jsonDecode(cartJson);
    Cart cart = Cart.fromJson(cartMap);
    return cart;
  } else {
    return Cart();
  }
}
