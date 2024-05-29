
import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_restaurant_ui/models/user.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? productID;
  String? description;
  String? name;
  double? price;
  String? image;

  Product(
      this.productID,
      this.description,
      this.image,
      this.name,
      this.price
  );

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}