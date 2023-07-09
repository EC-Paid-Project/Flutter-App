import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../reduxStore/app_state.dart';

class SmallProduct {
  final String image;

  SmallProduct(this.image);
}

List<SmallProduct> smProducts = [
  SmallProduct(
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
  SmallProduct(
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
  SmallProduct(
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
];

class ProductDetails extends StatelessWidget {
  String title;
  String price;
  String description;
  ProductDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.description});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.5;
    return Container(
      height: height,
      padding: const EdgeInsets.only(top: 10, right: 14, left: 14),
      decoration: BoxDecoration(
        color: Colors.cyan[50],
        border: Border.all(color: const Color.fromARGB(122, 158, 158, 158)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            const Text(
              'Similar to this',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final lpg = StoreProvider.of<AppState>(context)
                        .state
                        .lpgList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/productDetail",
                            arguments: lpg.id.toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.network(
                              lpg.image,
                              height: 70,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
