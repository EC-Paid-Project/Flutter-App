import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Terms and Conditions'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By using our mobile application, you agree to the following terms and conditions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Product Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We strive to provide accurate and up-to-date information about our liquid petroleum gas containers, including pricing, specifications, and availability. However, we cannot guarantee the accuracy and completeness of the information at all times. It is the customer\'s responsibility to verify the details before making a purchase.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Purchase and Delivery',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'All purchases made through our mobile application are subject to product availability. We reserve the right to cancel or modify orders if the product is out of stock or if there are any pricing or technical errors. Delivery of the liquid petroleum gas containers will be made to the address specified by the customer during the order process.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Safety Precautions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Handling and usage of liquid petroleum gas containers must strictly adhere to the safety guidelines provided by the manufacturer. It is the customer\'s responsibility to familiarize themselves with the safety precautions and follow them accordingly. We shall not be held liable for any damages or accidents resulting from improper handling or usage of the products.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Returns and Refunds',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Returns and refunds are subject to our company\'s return policy. If you wish to return a liquid petroleum gas container, please contact our customer support within 7 days of the delivery date. The product must be unused and in its original packaging for a valid return and refund.',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
