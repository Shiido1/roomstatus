// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleSalesResponseModel _$SingleSalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    SingleSalesResponseModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      total: json['total'],
      booking: json['booking'] as String?,
      customer: json['customer'] as String?,
      customerType: json['customer_type'] as String?,
      date: json['date'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      staff: json['staff'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SingleSalesResponseModelToJson(
        SingleSalesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'total': instance.total,
      'booking': instance.booking,
      'customer': instance.customer,
      'customer_type': instance.customerType,
      'date': instance.date,
      'mode_of_payment': instance.modeOfPayment,
      'staff': instance.staff,
      'items': instance.items,
    };
