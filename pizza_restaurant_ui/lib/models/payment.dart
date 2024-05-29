import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_restaurant_ui/models/user.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'payment.g.dart';

@JsonSerializable()
class Payment {
  int? paymentID;
  double? total;
  DateTime? dateOfPayment;
  String? numberOfPayment;

  Payment(
      this.paymentID,
      this.total,
      this.dateOfPayment,
      this.numberOfPayment
  );

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}