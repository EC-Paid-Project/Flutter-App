import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../models/food_and_category.dart';
import '../../../reduxStore/action.dart';
import '../../../reduxStore/app_state.dart';

class ProductBottomNavigationBar extends StatelessWidget {
  final LPG lpg;
  const ProductBottomNavigationBar({super.key, required this.lpg});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.5;
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store.state.cart,
        builder: (context, cart) {
          return Container(
            height: 80,
            color: Colors.cyan[50],
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      final bool itemExists = store.state.cart.lpg.any(
                        (item) => item.id == lpg.id,
                      );

                      if (itemExists == true) {
                        Navigator.of(context).pushNamed("/cart");
                      } else {
                        store.dispatch(
                            CartAction(CartActionType.addItem, payload: lpg));
                        Navigator.of(context).pushNamed("/cart");
                      }
                    },
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        '+ Add to Cart',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
