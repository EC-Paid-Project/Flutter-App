import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/addressAndPhone.dart';
import '../../../models/cart.dart';
import '../../../models/distributor.dart';
import '../../../platformSettings/dialoguebox.dart';
import '../../../urls/urls.dart';

void cashOnDeliveryDialogue(BuildContext context,
    {String type = "COD", String transId = "-1"}) async {
  showPlatformDialog(
    context: context,
    builder: (_) => PlatformAlertDialog(
      title: 'Confirm Payment',
      content: 'Are you sure you want to proceed?',
      onCancelPressed: () {
        Navigator.of(context).pop();
      },
      onConfirmPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? cartJson = prefs.getString('cart');
        String? LpgDistributor = prefs.getString('LpgDistributor');
        String? addressAndPhoneJson = prefs.getString('lpgAddress');
        if (cartJson != null &&
            addressAndPhoneJson != null &&
            LpgDistributor != null) {
          Map<String, dynamic> cartMap = jsonDecode(cartJson);
          Map<String, dynamic> addressAndPhoneJson1 =
              jsonDecode(addressAndPhoneJson);
          Map<String, dynamic> LpgDistributor1 = jsonDecode(LpgDistributor);
          Cart cart = Cart.fromJson(cartMap);
          AddressAndPhone addressAndPhone =
              AddressAndPhone.fromJson(addressAndPhoneJson1);
          Distributor distributor = Distributor.fromJson(LpgDistributor1);
          sendOrder(
            cart.lpg,
            addressAndPhone,
            type,
            distributor.id.toString(),
            transId,
          );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.pushNamed(context, "/orderPlaced");
        }
      },
    ),
  );
}
