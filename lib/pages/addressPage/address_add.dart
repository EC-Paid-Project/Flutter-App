import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/addressAndPhone.dart';
import 'action/addressAction.dart';
import 'address_form.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final AddressAndPhone addressAndPhone = AddressAndPhone();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Address Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, viewportConstraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Container(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).padding.bottom == 0
                    ? 20
                    : MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(
                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    getUserAddress(context, addressAndPhone);
                                  },
                                  child: Icon(Icons.home),
                                ),
                                const Text(
                                  'Add New Address',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AddAddressForm(addressAndPhone: addressAndPhone),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: Text("Proceed"),
                      onPressed: () async {
                        if (addressAndPhone.isValid()) {
                          setState(() {
                            errorMessage = '';
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString("lpgAddress",
                              jsonEncode(addressAndPhone.toJson()));
                          Navigator.pushNamed(context, "/map",
                              arguments: {"isClick": true});
                        } else {
                          setState(() {
                            errorMessage =
                                'Please fill all fields correctly and ensure the phone number has 10 digits.';
                          });
                        }
                      },
                    ),
                  ),
                  errorMessage.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
