// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmountOwed: (json['Total Amount Owed'] as num?)?.toInt(),
      totalAmountReceived: (json['Total Amount Received'] as num?)?.toInt(),
      balanceNet: (json['Balance/Net'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'payments': instance.payments,
      'Total Amount Owed': instance.totalAmountOwed,
      'Total Amount Received': instance.totalAmountReceived,
      'Balance/Net': instance.balanceNet,
    };
