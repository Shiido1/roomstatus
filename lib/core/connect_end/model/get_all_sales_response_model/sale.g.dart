// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      total: json['total'],
      booking: json['booking'] as String?,
      customer: json['customer'] as String?,
      customerType: json['customer_type'] as String?,
      date: json['date'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      staff: json['staff'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'total': instance.total,
      'booking': instance.booking,
      'customer': instance.customer,
      'customer_type': instance.customerType,
      'date': instance.date,
      'mode_of_payment': instance.modeOfPayment,
      'staff': instance.staff,
      'items_count': instance.itemsCount,
    };
