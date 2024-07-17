// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt(),
      item: json['item'] as String?,
      itemId: (json['item_id'] as num?)?.toInt(),
      itemPrice: (json['item_price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      discount: json['discount'],
      image: json['image'] as String?,
      totalPrice: (json['total_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'item': instance.item,
      'item_price': instance.itemPrice,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'image': instance.image,
      'total_price': instance.totalPrice,
    };
