// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sales: (json['sales'] as List<dynamic>?)
          ?.map((e) => Sale.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItemsQuantitySold:
          (json['Total items quantity sold'] as num?)?.toInt(),
      averageDiscount: json['Average Discount'] as String?,
      totalAmountGenerated: (json['Total Amount Generated'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'sales': instance.sales,
      'Total items quantity sold': instance.totalItemsQuantitySold,
      'Average Discount': instance.averageDiscount,
      'Total Amount Generated': instance.totalAmountGenerated,
    };
