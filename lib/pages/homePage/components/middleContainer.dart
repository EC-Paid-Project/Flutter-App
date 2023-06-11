import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/productGrid/product_grid.dart';

class GradientContainer extends StatelessWidget {
  final String text;
  final String image;
  GradientContainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height / 6;
    double containerWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00CCFF),
              Color(0xFF66FFFF),
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/gridpage');
                    },
                    child: const Text('Order Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan[700],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: containerHeight * 0.8,
              height: containerHeight * 0.8,
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
