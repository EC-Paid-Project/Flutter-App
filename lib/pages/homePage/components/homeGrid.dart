import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';
import '../actions/homegride.dart';
import 'gridItems.dart';

class GridContainer extends StatelessWidget {
  final List<String> images = [
    'LPG1.jpeg',
    'LPG2.jpeg',
    'LPG3.jpg',
    'LPG4.jpeg',
    'LPG5.png',
    'LPG6.jpeg',
  ];

  final List<String> texts = [
    '0.5Kg',
    '1.0Kg',
    '1.5Kg',
    '2.0Kg',
    '2.5Kg',
    '3.0Kg',
  ];

  GridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height / 4;
    double containerWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: homePageProducts(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<LPG> products = snapshot.data! as List<LPG>;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Container(
              height: containerHeight,
              width: containerWidth,
              color: Colors.cyan[50],
              child: GridView.count(
                padding: EdgeInsets.all(0),
                crossAxisCount: 3,
                childAspectRatio: containerWidth / (containerHeight * 1.5),
                children: products.map((product) {
                  final index = products.indexOf(product);
                  final lpg = products[index];
                  return PopularGridItem(lpg: lpg);
                }).toList(),
              ),
            ),
          );
        } else {
          return Text('No data available.');
        }
      },
    );
  }
}
