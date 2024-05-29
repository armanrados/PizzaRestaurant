import '../models/gallery.dart';
import '../models/order.dart';
import 'base_provider.dart';

class OrderProvider extends BaseProvider<Order> {
    OrderProvider(): super("Order");

   @override
   Order fromJson(data) {
    return Order.fromJson(data);
  }
}