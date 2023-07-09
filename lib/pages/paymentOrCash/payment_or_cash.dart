import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'actions/cashAndPaymentAction.dart';

class PaymentOrCashPage extends StatelessWidget {
  const PaymentOrCashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Payment Page'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: constraints.maxHeight * 0.01),
                const FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextButton.icon(
                    onPressed: () {
                      cashOnDeliveryDialogue(context);
                    },
                    icon: Icon(Icons.attach_money),
                    label: Text('Cash on Delivery'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 60, 190, 4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/billingDetailsPage");
                    },
                    icon: Icon(Icons.payment),
                    label: Text('Online Payment'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 91, 176, 245),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
