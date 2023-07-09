import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../models/addressAndPhone.dart';

void getUserAddress(
    BuildContext context, AddressAndPhone addressAndPhone) async {
  if (true) {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String area = placemarks.first.subLocality ?? '';
      String postcode = placemarks.first.postalCode ?? '';
      String houseNo = placemarks.first.street ?? '';
      String city = placemarks.first.locality ?? '';
      addressAndPhone.houseNo = houseNo;
      addressAndPhone.area = area;
      addressAndPhone.postCode = postcode;
      addressAndPhone.city = city;
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text('Home Address'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your home address is:'),
              SizedBox(height: 8),
              Text('Flat Number/House Number: ${addressAndPhone.area}'),
              Text('Street: ${addressAndPhone.houseNo}'),
              Text('City: ${addressAndPhone.city}'),
              Text('PostCode: ${addressAndPhone.postCode}'),
            ],
          ),
          actions: [
            PlatformDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text('Error'),
          content: Text('Failed to retrieve home address. Error: $e'),
          actions: [
            PlatformDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
