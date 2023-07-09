import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/productGrid/actions/actions.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../models/food_and_category.dart';
import '../searchBar/searchbar.dart';
import 'components/gird_items.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key, Object? arguments}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 30) / 2;
    final itemHeight = itemWidth * 1.2;
    return PlatformScaffold(
      backgroundColor: Colors.cyan[100],
      appBar: PlatformAppBar(
        title: Text('Catalog'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSearchBar(
            filter: true,
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: getAllProduct(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  List<LPG> lpg = snapshot.data!;
                  return CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: itemWidth / itemHeight,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return GridItem(
                              width: itemWidth,
                              height: itemHeight,
                              lpg: lpg[index],
                            );
                          },
                          childCount: lpg.length,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: Text("No data found!"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
