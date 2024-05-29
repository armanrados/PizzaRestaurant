import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_restaurant_ui/models/payment.dart';
import 'package:pizza_restaurant_ui/models/product.dart';
import 'package:pizza_restaurant_ui/models/user.dart';

import 'order_product.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'order.g.dart';

@JsonSerializable()
class Order{
  int? orderID;
  int? userID;
  User? user;
  DateTime? dateOfOrder;
  bool? isCanceled;
  bool? isShipped;
  String? orderNumber;
  List<OrderProduct>? orderProducts;
  double? totalPrice;


  Order(
     this.orderID,
     this.userID,
     this.user,
     this.dateOfOrder,
     this.isCanceled,
     this.isShipped,
     this.orderNumber,
     this.orderProducts,
     this.totalPrice

  );

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}