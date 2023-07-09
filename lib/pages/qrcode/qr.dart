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
        title: Text('QR Code Scanner'),
        automaticallyImplyLeading: false,
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
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
        scannedData = scanData.code!;
        final productId = scannedData.split(":")[1].trim();
        Navigator.popAndPushNamed(context, "/productDetail",
            arguments: productId.toString());
      });
    });
  }
}

String getOrderIDFromScannedData(String scannedData) {
  List<String> dataParts = scannedData.split(',');
  for (String part in dataParts) {
    if (part.trim().startsWith('Order ID:')) {
      return part.replaceAll('Order ID:', '').trim();
    }
  }
  return '';
}
