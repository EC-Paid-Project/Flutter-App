import 'package:flutter/material.dart';
import '../../models/addressAndPhone.dart';
import '../../platformSettings/input.dart';

class AddAddressForm extends StatelessWidget {
  final AddressAndPhone addressAndPhone;
  const AddAddressForm({super.key, required this.addressAndPhone});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: PlatformTextField(
              labelText: 'Flat Number/House Number',
              prefixIcon: Icon(Icons.home),
              onChanged: (value) {
                addressAndPhone.houseNo = value;
              },
              controller: TextEditingController(text: addressAndPhone.houseNo),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: PlatformTextField(
              labelText: 'Area',
              prefixIcon: Icon(Icons.location_on),
              onChanged: (value) {
                addressAndPhone.area = value;
              },
              controller: TextEditingController(text: addressAndPhone.area),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: PlatformTextField(
              labelText: 'City',
              prefixIcon: Icon(Icons.location_city),
              onChanged: (value) {
                addressAndPhone.city = value;
              },
              controller: TextEditingController(text: addressAndPhone.city),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: PlatformTextField(
              labelText: 'Postcode',
              prefixIcon: Icon(Icons.mail),
              onChanged: (value) {
                addressAndPhone.postCode = value;
              },
              controller: TextEditingController(text: addressAndPhone.postCode),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: PlatformTextField(
              labelText: 'Phone',
              prefixIcon: Icon(Icons.phone),
              onChanged: (value) {
                int? parsedValue = int.tryParse(value);
                if (parsedValue != null) {
                  addressAndPhone.phone = parsedValue;
                }
              },
              controller:
                  TextEditingController(text: addressAndPhone.phone.toString()),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
