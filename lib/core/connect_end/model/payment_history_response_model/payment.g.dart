// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: (json['id'] as num?)?.toInt(),
      transactionDate: json['transaction date'] as String?,
      amountPaid: (json['amount_paid'] as num?)?.toInt(),
      due: json['due'],
      net: (json['net'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'transaction date': instance.transactionDate,
      'amount_paid': instance.amountPaid,
      'due': instance.due,
      'net': instance.net,
    };
