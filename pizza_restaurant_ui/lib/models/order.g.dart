// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['orderID'] as int?,
      json['userID'] as int?,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['dateOfOrder'] == null
          ? null
          : DateTime.parse(json['dateOfOrder'] as String),
      json['isCanceled'] as bool?,
      json['isShipped'] as bool?,
      json['orderNumber'] as String?,
      (json['orderProducts'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderID': instance.orderID,
      'userID': instance.userID,
      'user': instance.user,
      'dateOfOrder': instance.dateOfOrder?.toIso8601String(),
      'isCanceled': instance.isCanceled,
      'isShipped': instance.isShipped,
      'orderNumber': instance.orderNumber,
      'orderProducts': instance.orderProducts,
      'totalPrice': instance.totalPrice,
    };
