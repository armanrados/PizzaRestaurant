import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/models/order.dart';
import 'package:pizza_restaurant_ui/providers/order_provider.dart';
import 'package:provider/provider.dart';

import '../utils/util.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}): super(key: key);
  static const String routeName = "/order";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderProvider? _orderProvider;
  List<Order> list = [];

  @override
  void initState() {

    super.initState();
    _orderProvider = context.read<OrderProvider>();
    loadData();
  }

   Future loadData() async {
    var tmpData = await _orderProvider!.get({
      'userID': Authorization.user!.userID,
      'isShipped': false,
      'isCanceled':false,
      'includeUser':true,
      'includeOrderProducts':true,
      'includePayment':true
    });
    setState(() {
      list = tmpData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: _buildOrders(),
          )
        ]),
      ),
    );
  }

  Widget _buildOrders()
  {
    if (list.isEmpty) {
      return Center(
        child: Text("No orders at this moment."),
      );
    }

    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _buildOrderCard(list[index]);
        },
      ),
    );
  }

   Widget _buildOrderCard(Order item) {
    return ListTile(
      leading: IconButton(
        onPressed: () async {
          Map update = {
            "isCanceled": true,
            "isShipped": false
          };

          await _orderProvider!.update(item.orderID!, update);
          loadData();
          ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Order canceled"), backgroundColor: Color.fromARGB(255, 46, 92, 232),));
        },
        icon: Icon(Icons.delete),
        iconSize: 30,
        color: Colors.red,
      ),
      title: Text("${item.orderNumber}", style: TextStyle(fontSize: 14),),
      subtitle: Text(
          "Products: ${item.orderProducts}"),
      trailing: Text("${item.totalPrice} EUR"),
    );
  }
}