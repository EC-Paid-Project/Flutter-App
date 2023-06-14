import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  QRCodeScannerState createState() => QRCodeScannerState();
}

class QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  late String scannedData;

  @override
  void initState() {
    super.initState();
    scannedData = '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
        title: Text('QR Code Scanner'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Positioned(
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Positioned(
            bottom: 24.0,
            child: Text(
              'Scanned Data: $scannedData',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
         scannedData = scanData.code! ;
        print(scannedData);
         String orderId = getOrderIDFromScannedData(scannedData);
      print('Order ID: $orderId');
        
      });
    });
  }
}
String getOrderIDFromScannedData(String scannedData) {
  // Split the scanned data using commas
  List<String> dataParts = scannedData.split(',');

  // Iterate through the data parts and find the part containing 'Order ID:'
  for (String part in dataParts) {
    if (part.trim().startsWith('Order ID:')) {
      // Extract the order ID by removing 'Order ID:' and any leading/trailing spaces
      return part.replaceAll('Order ID:', '').trim();
    }
  }

  // Return an empty string if the order ID is not found
  return '';
}
