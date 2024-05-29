import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_restaurant_ui/models/product.dart';
import 'package:pizza_restaurant_ui/models/user.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'order_product.g.dart';

@JsonSerializable()
class OrderProduct {
  int? orderProductID;
  Product? product;
  int? productID;
  int? orderID;
  int? amount;


  OrderProduct(
      this.orderProductID,
      this.product,
      this.productID,
      this.orderID,
      this.amount
  );

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}