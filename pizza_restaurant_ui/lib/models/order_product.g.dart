// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      json['orderProductID'] as int?,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      json['productID'] as int?,
      json['orderID'] as int?,
      json['amount'] as int?,
    );

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'orderProductID': instance.orderProductID,
      'product': instance.product,
      'productID': instance.productID,
      'orderID': instance.orderID,
      'amount': instance.amount,
    };
