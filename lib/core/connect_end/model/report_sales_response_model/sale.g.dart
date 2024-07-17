// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      code: json['code'] as String?,
      booking: json['booking'] as String?,
      customer: json['customer'] as String?,
      item: json['item'] as String?,
      itemPrice: (json['item_price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      customerType: json['customer_type'] as String?,
      date: json['date'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      staff: json['staff'] as String?,
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'code': instance.code,
      'booking': instance.booking,
      'customer': instance.customer,
      'item': instance.item,
      'item_price': instance.itemPrice,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'total_price': instance.totalPrice,
      'customer_type': instance.customerType,
      'date': instance.date,
      'mode_of_payment': instance.modeOfPayment,
      'staff': instance.staff,
    };
