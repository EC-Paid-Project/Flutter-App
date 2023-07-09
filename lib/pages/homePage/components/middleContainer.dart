import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/platformSettings/button.dart';

class GradientContainer extends StatelessWidget {
  final String text;
  final String image;
  const GradientContainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height / 4;
    double buttonHeight = MediaQuery.of(context).size.height / 19.5;
    double buttonWidth = MediaQuery.of(context).size.width / 2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00CCFF),
              Color(0xFF66FFFF),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child: CustomButton(
                        text: 'More Products',
                        onPressed: () async {
                          final Map<String, String> jsonData = {
                            'search': "".toString()
                          };
                          final jsonString = jsonEncode(jsonData);
                          Navigator.pushNamed(context, '/gridPage',
                              arguments: jsonString);
                        }),
                  ),
                ],
              ),
            ),
            Container(
              width: containerHeight * 0.6,
              height: containerHeight * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
