import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  int indexNum = 0;
  BottomNavigationBarForApp({required this.indexNum, super.key});
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.cyan,
      backgroundColor: Colors.grey.shade700,
      buttonBackgroundColor: Colors.deepOrange.shade300,
      height: 50,
      animationDuration: const Duration(milliseconds: 600),
      animationCurve: Curves.easeInOut,
      index: indexNum,
      items: const [
        Icon(Icons.home),
        Icon(Icons.qr_code),
        Icon(Icons.shopping_bag),
        Icon(Icons.shopping_cart_outlined),
        Icon(Icons.map),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/homePage');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/qr');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/orderHistory');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 4) {
          Navigator.pushNamed(context, '/map');
        }
      },
    );
  }
}
