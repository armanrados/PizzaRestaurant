import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/models/order_product.dart';
import 'package:pizza_restaurant_ui/providers/order_provider.dart';
import 'package:pizza_restaurant_ui/providers/payment_provider.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/payment.dart';
import '../providers/cart_provider.dart';
import '../utils/util.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider _cartProvider;
  OrderProvider? _orderProvider;
  PaymentProvider? _paymentProvider;
  double amount = 0;
  Payment? payment; // Declare payment here

  @override
  void initState() {
    super.initState();
    _orderProvider = context.read<OrderProvider>();
    _paymentProvider = context.read<PaymentProvider>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartProvider = context.watch<CartProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My cart"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(child: _buildProductCardList()),
          if (_cartProvider.cart.items.isNotEmpty)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber),
              onPressed: () async {
                await makePayment(CalculateTotal());
              },
              child: Text(
                "Order",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }

  double CalculateTotal() {
    amount = 0;  // Reset amount before calculating total
    _cartProvider.cart.items.forEach((element) {
      amount += (element.product.price! * element.count).toDouble();
    });

    return amount;
  }

  Widget _buildProductCardList() {
    if (_cartProvider.cart.items.isEmpty) {
      return Center(
        child: Text("Cart is empty!"),
      );
    }

    return ListView.builder(
      itemCount: _cartProvider.cart.items.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_cartProvider.cart.items[index]);
      },
    );
  }

  Widget _buildProductCard(CartItem item) {
    return ListTile(
      leading: imageFromBase64String(item.product.image!),
      title: Text("${item.product.name} | Amount: ${item.count.toString()}"),
      subtitle: Text(
          "Price ${formatNumber(item.product.price)} EUR | total: ${formatNumber(item.product.price! * item.count)} EUR"),
      trailing: IconButton(
        onPressed: () {
          _cartProvider.removeFromCart(item.product);
        },
        icon: Icon(Icons.delete),
        iconSize: 30.0,
        color: Colors.red,
      ),
    );
  }

  Future<void> makePayment(double amount) async {
    try {
      await InsertOrders();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Payment successful!"),
          backgroundColor: Colors.amber,
        ),
      );
    } catch (e) {
      print('Error in makePayment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Payment failed!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> insertPayment(double total) async {
    try {
      Map request = {
        "total": total,
        "numberOfPayment": "NA", // Not applicable since no real payment
      };

      payment = await _paymentProvider!.insert(request);
      if (payment == null) {
        throw Exception('Failed to insert payment');
      }
    } catch (e) {
      print('Error inserting payment: $e');
      throw Exception('Failed to insert payment');
    }
  }

 Future<void> InsertOrders() async {
  try {
    await insertPayment(amount); // Ensure payment is assigned here

    List<Map<String, dynamic>> orderProducts = [];
    _cartProvider.cart.items.forEach((element) {
      orderProducts.add({
        "productID": element.product.productID,
        "amount": element.count,
      });
    });

    if (payment == null) {
      throw Exception('Payment information is missing');
    }

    Map<String, dynamic> order = {
      "userID": Authorization.user!.userID,
      "paymentID": payment!.paymentID,
      "orderProducts": orderProducts,
      "dateOfOrder": DateTime.now().toIso8601String(), // Example of ISO 8601 format
    };

    print('InsertOrders request: $order'); // Log the request

    var response = await _orderProvider!.insert(order);

    print('InsertOrders response: $response'); // Log the response

    setState(() {
      _cartProvider.cart.items.clear();
    });
  } catch (e) {
    print('Error inserting order: $e');
    throw Exception('Failed to insert order');
  }
}
}
