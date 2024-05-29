// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      json['paymentID'] as int?,
      (json['total'] as num?)?.toDouble(),
      json['dateOfPayment'] == null
          ? null
          : DateTime.parse(json['dateOfPayment'] as String),
      json['numberOfPayment'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'paymentID': instance.paymentID,
      'total': instance.total,
      'dateOfPayment': instance.dateOfPayment?.toIso8601String(),
      'numberOfPayment': instance.numberOfPayment,
    };
