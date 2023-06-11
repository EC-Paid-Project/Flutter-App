import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_ecommerce_app/googleMap/google_map.dart';
import 'package:flutter_ecommerce_app/pages/cart/CartPage.dart';
import 'package:flutter_ecommerce_app/pages/homePage/homePage.dart';
import 'package:flutter_ecommerce_app/pages/profilePage/profile_page.dart';
import 'package:flutter_ecommerce_app/pages/qrcode/qr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 2;
  final screens = [
    ProfilePage(ProfileData(
        name: 'Usman Khalid',
        email: 'uksiddiqu88@gmail.com',
        password: 'helloworld24',
        phoneNo: '03123742371',
        address: 'Karachi')),
    QRCodeScanner(),
    HomePage(),
    CartPage(),
    MapPage()
  ];
  final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Colors.cyan,
        backgroundColor: Colors.grey.shade700,
        buttonBackgroundColor: Colors.deepOrange.shade300,
        height: 50,
        animationDuration: const Duration(milliseconds: 600),
        animationCurve: Curves.easeInOut,
        index: index,
        items: const [
          Icon(Icons.person),
          Icon(Icons.qr_code),
          Icon(Icons.home),
          Icon(Icons.shopping_cart_checkout),
          Icon(Icons.map)
        ],
        onTap: (index) => setState(() {
          this.index = index;
        }),
        letIndexChange: (index) => true,
      ),
    );
  }
}
