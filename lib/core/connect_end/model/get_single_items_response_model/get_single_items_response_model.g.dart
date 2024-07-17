// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_items_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleItemsResponseModel _$GetSingleItemsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleItemsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      category: json['category'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetSingleItemsResponseModelToJson(
        GetSingleItemsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'image': instance.image,
    };
