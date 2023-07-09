import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/food_and_category.dart';

class PopularGridItem extends StatelessWidget {
  final LPG lpg;
  const PopularGridItem({super.key, required this.lpg});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/productDetail',
            arguments: lpg.id.toString());
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(lpg.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              lpg.title,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
