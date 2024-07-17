// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      revenues: json['revenues'] == null
          ? null
          : Revenues.fromJson(json['revenues'] as Map<String, dynamic>),
      expenditures: json['expenditures'] == null
          ? null
          : Expenditures.fromJson(json['expenditures'] as Map<String, dynamic>),
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'revenues': instance.revenues,
      'expenditures': instance.expenditures,
      'balance': instance.balance,
    };
