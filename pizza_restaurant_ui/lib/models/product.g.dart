// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['productID'] as int?,
      json['description'] as String?,
      json['image'] as String?,
      json['name'] as String?,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productID': instance.productID,
      'description': instance.description,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
