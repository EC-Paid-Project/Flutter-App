import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/mainPage/main_page.dart';
import 'package:flutter_ecommerce_app/pages/productDetail/action/productAction.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../models/food_and_category.dart';
import 'components/bottomnavigation.dart';
import 'components/productImage.dart';
import 'components/product_detail.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key, required String arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: Colors.white,
        appBar: PlatformAppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: Colors.black,
            ),
          ),
          trailingActions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: productDetailLoad(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                LPG lpg = snapshot.data as LPG;

                return Column(
                  children: [
                    ProductImage(image: lpg.image),
                    Expanded(
                      child: Stack(
                        children: [
                          ProductDetails(
                              title: lpg.title, price: lpg.price.toString()),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(child: SizedBox()),
                    ProductBottomNavigationBar(lpg: lpg),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
