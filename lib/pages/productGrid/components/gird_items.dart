import 'package:flutter/material.dart';
import '../../../models/food_and_category.dart';

class GridItem extends StatelessWidget {
  final LPG lpg;
  final double width;
  final double height;

  const GridItem({
    Key? key,
    required this.width,
    required this.height,
    required this.lpg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/productDetail", arguments: lpg.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: width,
          height: height - 26,
          margin: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 244, 244),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (lpg.discount != 0.0)
                Banner(
                  message: '${lpg.discount.toString()} % off}',
                  location: BannerLocation.topEnd,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      lpg.image,
                      width: width,
                      isAntiAlias: true,
                      height: (height - 26) * 0.6,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              else
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    lpg.image,
                    width: width,
                    isAntiAlias: true,
                    height: (height - 26) * 0.6,
                    fit: BoxFit.fill,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lpg.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${lpg.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
