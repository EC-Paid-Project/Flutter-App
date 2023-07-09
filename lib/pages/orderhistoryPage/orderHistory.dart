import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../models/orderHistory.dart';
import '../homePage/components/middleContainer.dart';
import 'actions/orderHistoryActions.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text("App")),
      body: Column(
        children: [
          const GradientContainer(
            text: "Order Detail",
            image:
                "https://www.shutterstock.com/image-vector/wallet-mascot-character-design-vector-1660276741",
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchOrderHistory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  if (snapshot.hasData) {
                    List<OrderHistoryData> orderHistory =
                        snapshot.data as List<OrderHistoryData>;
                    if (orderHistory.isEmpty) {
                      return Center(child: Text("No Data Found"));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemCount: orderHistory.length,
                      itemBuilder: (context, index) {
                        OrderHistoryData order = orderHistory[index];
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/orderDetail',
                                  arguments: (order.id).toString());
                            },
                            leading: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.5),
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const ClipOval(
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            title: Text('Order ID: ${order.id}'),
                            subtitle: Text('Status: ${order.status}'),
                            trailing: Text('Qty: ${order.totalItemsQty}'),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("No Data Found"));
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
