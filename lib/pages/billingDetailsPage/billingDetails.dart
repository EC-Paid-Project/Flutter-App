import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/urls/urls.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../paymentOrCash/actions/cashAndPaymentAction.dart';

class BillingDetailsPage extends StatefulWidget {
  const BillingDetailsPage({super.key});

  @override
  _BillingDetailsPageState createState() => _BillingDetailsPageState();
}

class _BillingDetailsPageState extends State<BillingDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  String selectedOption = 'Alfa Wallet';
  String walletNumber = '';
  String cardNumber = '';
  String cvv = '';
  String expiryDate = '';
  String phoneNumber = '';
  String email = '';
  String name = '';
  String accountNumber = '';

  List<String> dropdownOptions = [
    'Alfa Wallet',
    'Credit/Debit Card',
    'Bank Alfalah Account'
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Billing Details'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 31, 184, 204),
              Color.fromARGB(255, 0, 18, 20)
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DropdownButtonFormField<String>(
                  value: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                  items: dropdownOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(
                        option,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Select Option',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                if (selectedOption == 'Alfa Wallet')
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        walletNumber = value;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Wallet Number',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                if (selectedOption == 'Credit/Debit Card')
                  Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            cardNumber = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            cvv = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            expiryDate = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (selectedOption == 'Bank Alfalah Account')
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        accountNumber = value;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Country',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    }),
                SizedBox(height: 16.0),
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    }),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final a = await bank(
                          email, phoneNumber, accountNumber, "pakistan");
                      if (a != "") {
                        cashOnDeliveryDialogue(context,
                            type: "Alfa Pay", transId: a);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 154, 173),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
