// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      roomRate: (json['Room Rate'] as num?)?.toInt(),
      dayS: (json['Day(s)'] as num?)?.toInt(),
      totalAmount: (json['Total amount'] as num?)?.toInt(),
      discountPrice: (json['discount price'] as num?)?.toInt(),
      vat: json['VAT'] as String?,
      totalDue: (json['Total Due'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Room Rate': instance.roomRate,
      'Day(s)': instance.dayS,
      'Total amount': instance.totalAmount,
      'discount price': instance.discountPrice,
      'VAT': instance.vat,
      'Total Due': instance.totalDue,
    };
